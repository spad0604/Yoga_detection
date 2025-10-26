import 'dart:async';
import 'dart:convert';
import 'dart:isolate';
import 'dart:typed_data';

import 'package:flutter/widgets.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

/// Socket.IO isolate helper.
///
/// Commands accepted by isolate (messages sent to the isolate SendPort):
/// - { cmd: 'connect', url: String, headers?: Map<String,String> }
/// - { cmd: 'send_pose', json: String }
/// - { cmd: 'send_image', data: Uint8List }
/// - { cmd: 'ping', payload: String }
/// - { cmd: 'disconnect' }
///
/// Events emitted back to the main isolate are Maps with a `type` field.
class WebSocketIsolate {
  Isolate? _isolate;
  SendPort? _sendPort;
  final _receivePort = ReceivePort();
  final StreamController<Map<String, dynamic>> _events = StreamController.broadcast();

  Stream<Map<String, dynamic>> get events => _events.stream;

  Future<void> start(String url,
      {Map<String, String>? headers, Duration timeout = const Duration(seconds: 5)}) async {
    _receivePort.listen(_handleMessage, onDone: () {
      _events.close();
    });

    _isolate = await Isolate.spawn(_isolateEntry, _receivePort.sendPort);

    // wait for sendPort
    final sw = Stopwatch()..start();
    while (_sendPort == null) {
      if (sw.elapsed > timeout) throw TimeoutException('Timed out waiting for isolate sendPort');
      await Future.delayed(const Duration(milliseconds: 50));
    }

    final payload = <String, dynamic>{'cmd': 'connect', 'url': url};
    if (headers != null) payload['headers'] = headers;
    _sendPort!.send(payload);
  }

  void _handleMessage(dynamic message) {
    if (message is SendPort) {
      _sendPort = message;
      debugPrint('Socket isolate sendPort received');
    } else if (message is Map) {
      _events.add(Map<String, dynamic>.from(message));
      debugPrint('Event from isolate: $message');
    } else {
      _events.add({'type': 'raw', 'data': message.toString()});
    }
  }

  void sendPoseRequests(dynamic posesJsonOrObject) {
    if (_sendPort == null) throw StateError('Isolate not started');
    final jsonString =
        posesJsonOrObject is String ? posesJsonOrObject : jsonEncode(posesJsonOrObject);
    _sendPort!.send({'cmd': 'send_pose', 'json': jsonString});
  }

  void sendImage(Uint8List imageData) {
    if (_sendPort == null) throw StateError('Isolate not started');
    _sendPort!.send({'cmd': 'send_image', 'data': imageData});
  }

  void sendPing([String payload = 'ping']) {
    if (_sendPort == null) throw StateError('Isolate not started');
    _sendPort!.send({'cmd': 'ping', 'payload': payload});
  }

  /// Schedule periodic pings from the isolate side.
  /// interval: how often to ping. If null or Duration.zero, cancels any existing periodic pings.
  void setPingInterval(Duration? interval, {String payload = 'ping'}) {
    if (_sendPort == null) throw StateError('Isolate not started');
    if (interval == null || interval == Duration.zero) {
      _sendPort!.send({'cmd': 'set_ping_interval', 'interval_ms': 0});
    } else {
      _sendPort!.send(
          {'cmd': 'set_ping_interval', 'interval_ms': interval.inMilliseconds, 'payload': payload});
    }
  }

  Future<void> stop() async {
    try {
      _sendPort?.send({'cmd': 'disconnect'});
    } catch (_) {}
    try {
      _isolate?.kill(priority: Isolate.immediate);
    } catch (_) {}
    _isolate = null;
    _receivePort.close();
  }

  // Isolate entry
  static Future<void> _isolateEntry(SendPort mainSendPort) async {
    final port = ReceivePort();
    mainSendPort.send(port.sendPort);

    IO.Socket? socket;

    Timer? periodicTimer;

    port.listen((dynamic message) async {
      try {
        if (message is! Map || message['cmd'] == null) {
          mainSendPort.send({'type': 'error', 'message': 'Invalid message format'});
          return;
        }

        final cmd = message['cmd'] as String;

        if (cmd == 'connect') {
          final url = message['url'] as String?;
          if (url == null) {
            mainSendPort.send({'type': 'error', 'message': 'Missing url for connect'});
            return;
          }

          Map<String, dynamic>? headersMap;
          final rawHeaders = message['headers'];
          if (rawHeaders is Map) {
            headersMap = Map<String, dynamic>.from(rawHeaders);
          }

          try {
            final opts = <String, dynamic>{
              'transports': ['websocket'],
              'path': '/socket.io',
            };
            if (headersMap != null && headersMap.isNotEmpty) opts['extraHeaders'] = headersMap;

            socket = IO.io(url, opts);

            socket?.on('connect', (_) => mainSendPort.send({'type': 'connected', 'url': url}));
            socket?.on('disconnect', (_) => mainSendPort.send({'type': 'disconnected'}));
            socket?.on('connect_error',
                (err) => mainSendPort.send({'type': 'error', 'message': 'Connect failed: $err'}));

            socket?.on(
                'response_data', (data) => mainSendPort.send({'type': 'message', 'data': data}));
            socket?.on('message', (data) => mainSendPort.send({'type': 'message', 'data': data}));

            // Listen for pose_result event from backend
            socket?.on(
                'pose_result', (data) => mainSendPort.send({'type': 'pose_result', 'data': data}));
          } catch (e) {
            mainSendPort.send({'type': 'error', 'message': 'Connect failed: $e'});
          }
        } else if (cmd == 'send_pose') {
          final jsonString = message['json'] as String?;
          if (jsonString == null) {
            mainSendPort.send({'type': 'error', 'message': 'Missing json payload for send_pose'});
            return;
          }
          try {
            socket?.emit('send_data', jsonDecode(jsonString));
            mainSendPort.send({'type': 'sent', 'what': 'pose', 'bytes': jsonString.length});
          } catch (e) {
            mainSendPort.send({'type': 'error', 'message': 'Send pose failed: $e'});
          }
        } else if (cmd == 'send_image') {
          final data = message['data'];
          if (data is List<int>) {
            try {
              socket?.emit('send_image', data);
              mainSendPort.send({'type': 'sent', 'what': 'image', 'bytes': data.length});
            } catch (e) {
              mainSendPort.send({'type': 'error', 'message': 'Send image failed: $e'});
            }
          } else {
            mainSendPort.send({'type': 'error', 'message': 'Invalid image data type'});
          }
        } else if (cmd == 'ping') {
          final payload = (message['payload'] as String?) ?? 'ping';
          try {
            socket?.emit('ping', payload);
            mainSendPort.send({'type': 'sent', 'what': 'ping', 'bytes': payload.length});
          } catch (e) {
            mainSendPort.send({'type': 'error', 'message': 'Send ping failed: $e'});
          }
        } else if (cmd == 'set_ping_interval') {
          try {
            final ms = (message['interval_ms'] as int?) ?? 0;
            final payload = (message['payload'] as String?) ?? 'ping';
            // cancel existing
            periodicTimer?.cancel();
            periodicTimer = null;
            if (ms > 0) {
              periodicTimer = Timer.periodic(Duration(milliseconds: ms), (_) {
                try {
                  socket?.emit('ping', payload);
                  mainSendPort.send({'type': 'sent', 'what': 'ping', 'bytes': payload.length});
                } catch (e) {
                  mainSendPort.send({'type': 'error', 'message': 'Periodic ping failed: $e'});
                }
              });
              mainSendPort.send({'type': 'info', 'message': 'Ping interval set', 'ms': ms});
            } else {
              mainSendPort.send({'type': 'info', 'message': 'Ping interval cleared'});
            }
          } catch (e) {
            mainSendPort.send({'type': 'error', 'message': 'Set ping interval failed: $e'});
          }
        } else if (cmd == 'disconnect') {
          try {
            socket?.disconnect();
            mainSendPort.send({'type': 'disconnected'});
          } catch (e) {
            mainSendPort.send({'type': 'error', 'message': 'Disconnect failed: $e'});
          }
        } else {
          mainSendPort.send({'type': 'error', 'message': 'Unknown cmd: $cmd'});
        }
      } catch (e) {
        mainSendPort.send({'type': 'error', 'message': e.toString()});
      }
    });
  }
}
