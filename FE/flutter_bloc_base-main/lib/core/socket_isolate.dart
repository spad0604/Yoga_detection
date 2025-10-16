import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:isolate';
import 'dart:typed_data';

import 'package:flutter/widgets.dart';

/// WebSocket isolate helper.
///
/// Commands accepted by isolate:
/// - { cmd: 'connect', url: String }
/// - { cmd: 'send_pose', json: String }
/// - { cmd: 'send_image', data: Uint8List }
/// - { cmd: 'disconnect' }
///
/// Messages sent back to main isolate are Maps with a `type` field, e.g.:
/// { type: 'connected', url: 'ws://...' }
/// { type: 'message', data: '...', raw: true }
/// { type: 'binary', length: 123 }
/// { type: 'error', message: '...' }
class WebSocketIsolate {
  Isolate? _isolate;
  SendPort? _sendPort;
  final _receivePort = ReceivePort();
  final StreamController<Map<String, dynamic>> _events = StreamController.broadcast();

  Stream<Map<String, dynamic>> get events => _events.stream;

  /// Start the isolate and connect to [url]. Waits for the isolate send-port
  /// to be available before sending the connect command (with a timeout).
  Future<void> start(String url, {Duration timeout = const Duration(seconds: 5)}) async {
    _receivePort.listen(_handleMessage, onDone: () {
      _events.close();
    });

    _isolate = await Isolate.spawn(_socketEntry, _receivePort.sendPort);

    // Wait until sendPort is available (from the isolate) or timeout
    final sw = Stopwatch()..start();
    while (_sendPort == null) {
      if (sw.elapsed > timeout) {
        throw TimeoutException('Timed out waiting for isolate sendPort');
      }
      await Future.delayed(const Duration(milliseconds: 50));
    }

    // Now request connection
    _sendPort?.send({'cmd': 'connect', 'url': url});
  }

  void _handleMessage(dynamic message) {
    if (message is SendPort) {
      _sendPort = message;
      debugPrint('Socket isolate sendPort received');
    } else if (message is Map) {
      // structured event
      _events.add(Map<String, dynamic>.from(message));
      debugPrint('Event from isolate: $message');
    } else {
      debugPrint('Message received in main isolate: $message');
      _events.add({'type': 'raw', 'data': message.toString()});
    }
  }

  /// Send pose JSON (stringified). [posesJson] should be a JSON array string
  /// or you can pass Map/List and it will be encoded.
  void sendPoseRequests(dynamic posesJsonOrObject) {
    if (_sendPort == null) throw StateError('Isolate not started');
    String jsonString;
    if (posesJsonOrObject is String) {
      jsonString = posesJsonOrObject;
    } else {
      jsonString = jsonEncode(posesJsonOrObject);
    }
    _sendPort!.send({'cmd': 'send_pose', 'json': jsonString});
  }

  /// Send raw image bytes (Uint8List)
  void sendImage(Uint8List imageData) {
    if (_sendPort == null) throw StateError('Isolate not started');
    _sendPort!.send({'cmd': 'send_image', 'data': imageData});
  }

  /// Gracefully disconnect and stop the isolate
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

  static Future<void> _socketEntry(SendPort mainSendPort) async {
    final isoLateReceive = ReceivePort();
    // first message is the SendPort back to main isolate
    mainSendPort.send(isoLateReceive.sendPort);

    WebSocket? websocket;

    isoLateReceive.listen((dynamic message) async {
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
          try {
            websocket = await WebSocket.connect(url).timeout(const Duration(seconds: 10));
            mainSendPort.send({'type': 'connected', 'url': url});

            websocket!.listen((data) {
              // deliver structured messages back to main isolate
              if (data is String) {
                // try parse JSON
                try {
                  final parsed = jsonDecode(data);
                  mainSendPort.send({'type': 'message', 'data': parsed});
                } catch (_) {
                  mainSendPort.send({'type': 'message', 'data': data});
                }
              } else if (data is List<int>) {
                mainSendPort.send({'type': 'binary', 'length': data.length});
              }
            }, onDone: () {
              mainSendPort.send({'type': 'closed'});
            }, onError: (e) {
              mainSendPort.send({'type': 'error', 'message': e.toString()});
            });
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
            websocket?.add(jsonString);
            mainSendPort.send({'type': 'sent', 'what': 'pose', 'bytes': jsonString.length});
          } catch (e) {
            mainSendPort.send({'type': 'error', 'message': 'Send pose failed: $e'});
          }
        } else if (cmd == 'send_image') {
          final data = message['data'];
          if (data is List<int>) {
            try {
              websocket?.add(data);
              mainSendPort.send({'type': 'sent', 'what': 'image', 'bytes': data.length});
            } catch (e) {
              mainSendPort.send({'type': 'error', 'message': 'Send image failed: $e'});
            }
          } else {
            mainSendPort.send({'type': 'error', 'message': 'Invalid image data type'});
          }
        } else if (cmd == 'disconnect') {
          try {
            await websocket?.close();
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
