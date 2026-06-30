import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:just_audio/just_audio.dart';
import 'package:path_provider/path_provider.dart';

class ViettelTtsService {
  ViettelTtsService({Dio? dio, AudioPlayer? player})
      : _dio = dio ?? Dio(),
        _player = player ?? AudioPlayer();

  static const _providerDefine =
      String.fromEnvironment('TTS_PROVIDER', defaultValue: '');
  static const _urlDefine =
      String.fromEnvironment('VIETTEL_TTS_URL', defaultValue: '');
  static const _tokenDefine = String.fromEnvironment('VIETTEL_TTS_TOKEN');
  static const _voiceDefine =
      String.fromEnvironment('VIETTEL_TTS_VOICE', defaultValue: '');
  static const _speedDefine =
      String.fromEnvironment('VIETTEL_TTS_SPEED', defaultValue: '');
  static const _returnOptionDefine =
      String.fromEnvironment('VIETTEL_TTS_RETURN_OPTION', defaultValue: '');
  static const _withoutFilterDefine = bool.fromEnvironment(
    'VIETTEL_TTS_WITHOUT_FILTER',
    defaultValue: false,
  );

  final Dio _dio;
  final AudioPlayer _player;

  static const _defaultUrl = 'https://viettelai.vn/tts/speech_synthesis';
  static const _fallbackUrls = [
    'https://viettelai.vn/voice/api/tts/v1/rest/syn',
  ];

  Future<void> speak(String? text) async {
    final content = text?.trim();
    if (content == null || content.isEmpty) return;

    try {
      await _loadDotenvIfNeeded();
      final provider = _config('TTS_PROVIDER', _providerDefine).toLowerCase();
      final token = _config('VIETTEL_TTS_TOKEN', _tokenDefine);
      if (provider != 'viettel' || token.isEmpty) return;

      final configuredUrl = _sanitizeConfigValue(_config(
        'VIETTEL_TTS_URL',
        _urlDefine,
        _defaultUrl,
      ));
      final voice = _config('VIETTEL_TTS_VOICE', _voiceDefine, 'hcm-diemmy');
      final speed =
          double.tryParse(_config('VIETTEL_TTS_SPEED', _speedDefine, '1.0')) ??
              1.0;
      final returnOption = int.tryParse(
              _config('VIETTEL_TTS_RETURN_OPTION', _returnOptionDefine, '2')) ??
          2;
      final withoutFilter =
          _boolConfig('VIETTEL_TTS_WITHOUT_FILTER', _withoutFilterDefine);

      await _player.stop();
      final response = await _synthesizeSpeech(
        urls: _candidateUrls(configuredUrl),
        text: content,
        token: token,
        voice: voice,
        speed: speed,
        returnOption: returnOption,
        withoutFilter: withoutFilter,
      );

      if (response == null) return;
      await _playResponse(response);
    } catch (e) {
      debugPrint('Viettel TTS failed: $e');
    }
  }

  Future<void> _loadDotenvIfNeeded() async {
    if (dotenv.isInitialized) return;
    try {
      await dotenv.load(fileName: 'assets/.env');
    } catch (_) {
      // dart-define configuration is still supported when the asset is absent.
    }
  }

  String _config(String key, String defineValue, [String fallback = '']) {
    if (defineValue.isNotEmpty) return _sanitizeConfigValue(defineValue);
    return _sanitizeConfigValue(dotenv.env[key] ?? fallback);
  }

  bool _boolConfig(String key, bool defineValue) {
    final raw = dotenv.env[key]?.trim().toLowerCase();
    if (raw == null || raw.isEmpty) return defineValue;
    return raw == 'true' || raw == '1' || raw == 'yes';
  }

  String _sanitizeConfigValue(String value) {
    return value.trim().replaceAll(RegExp("^[\"']|[\"']\$"), '');
  }

  List<String> _candidateUrls(String configuredUrl) {
    final urls = <String>{};
    if (configuredUrl.isNotEmpty) urls.add(configuredUrl);
    urls.add(_defaultUrl);
    urls.addAll(_fallbackUrls);
    return urls.toList(growable: false);
  }

  Future<Response<List<int>>?> _synthesizeSpeech({
    required List<String> urls,
    required String text,
    required String token,
    required String voice,
    required double speed,
    required int returnOption,
    required bool withoutFilter,
  }) async {
    final payload = {
      'text': text,
      'voice': voice,
      'id': DateTime.now().millisecondsSinceEpoch.toString(),
      'speed': speed,
      'tts_return_option': returnOption,
      'token': token,
      'without_filter': withoutFilter,
    };

    DioException? lastException;
    Response<List<int>>? lastResponse;

    for (final url in urls) {
      try {
        final response = await _dio.post<List<int>>(
          url,
          data: payload,
          options: Options(
            responseType: ResponseType.bytes,
            validateStatus: (status) => status != null && status < 500,
            headers: {
              'Content-Type': 'application/json',
              'accept': '*/*',
            },
          ),
        );

        if (_isTokenError(response)) return response;
        if (response.statusCode != 404) return response;
        lastResponse = response;
        debugPrint('Viettel TTS endpoint not found: ${_redactedUrl(url)}');
      } on DioException catch (e) {
        lastException = e;
        debugPrint(
          'Viettel TTS request failed at ${_redactedUrl(url)}: '
          '${e.response?.statusCode ?? e.type}',
        );
      }
    }

    if (lastException != null) throw lastException;
    if (lastResponse != null) {
      debugPrint('Viettel TTS failed: all configured endpoints returned 404');
    }
    return null;
  }

  bool _isTokenError(Response<List<int>> response) {
    final statusCode = response.statusCode ?? 0;
    if (statusCode != 401 && statusCode != 403 && statusCode != 404) {
      return false;
    }

    final bytes = response.data;
    if (bytes == null || bytes.isEmpty) return false;

    final body = utf8.decode(bytes, allowMalformed: true).toLowerCase();
    return body.contains('token') &&
        (body.contains('not valid') ||
            body.contains('not exist') ||
            body.contains('không hợp lệ'));
  }

  String _redactedUrl(String url) {
    final uri = Uri.tryParse(url);
    if (uri == null) return url;
    return '${uri.scheme}://${uri.host}${uri.path}';
  }

  Future<void> _playResponse(Response<List<int>> response) async {
    final bytes = response.data;
    if (bytes == null || bytes.isEmpty) return;

    final statusCode = response.statusCode ?? 0;
    if (statusCode >= 400) {
      debugPrint(
        'Viettel TTS failed with HTTP $statusCode: '
        '${utf8.decode(bytes, allowMalformed: true)}',
      );
      return;
    }

    final contentType = response.headers.value(Headers.contentTypeHeader) ?? '';
    if (contentType.toLowerCase().contains('application/json')) {
      final decoded = jsonDecode(utf8.decode(bytes));
      await _playJsonPayload(decoded);
      return;
    }

    final bodyText = utf8.decode(bytes, allowMalformed: true).trim();
    if (bodyText.startsWith('{') || bodyText.startsWith('[')) {
      final decoded = jsonDecode(bodyText);
      await _playJsonPayload(decoded);
      return;
    }

    await _playAudioBytes(bytes, contentType: contentType);
  }

  Future<void> _playJsonPayload(dynamic payload) async {
    final playable = _findPlayableValue(payload);
    if (playable == null || playable.isEmpty) return;

    if (playable.startsWith('http://') || playable.startsWith('https://')) {
      await _player.setUrl(playable);
      await _player.play();
      return;
    }

    final base64Text =
        playable.startsWith('data:') ? playable.split(',').last : playable;
    final bytes = base64Decode(base64Text);
    await _playAudioBytes(bytes);
  }

  String? _findPlayableValue(dynamic value) {
    if (value is String) {
      final trimmed = value.trim();
      if (trimmed.startsWith('http://') ||
          trimmed.startsWith('https://') ||
          trimmed.startsWith('data:audio') ||
          _looksLikeBase64(trimmed)) {
        return trimmed;
      }
      return null;
    }

    if (value is Map) {
      const preferredKeys = [
        'url',
        'audio_url',
        'audioUrl',
        'file_url',
        'fileUrl',
        'data',
        'result',
        'audio',
        'audioContent',
      ];

      for (final key in preferredKeys) {
        if (value.containsKey(key)) {
          final found = _findPlayableValue(value[key]);
          if (found != null) return found;
        }
      }

      for (final entry in value.entries) {
        final found = _findPlayableValue(entry.value);
        if (found != null) return found;
      }
    }

    if (value is List) {
      for (final item in value) {
        final found = _findPlayableValue(item);
        if (found != null) return found;
      }
    }

    return null;
  }

  bool _looksLikeBase64(String value) {
    if (value.length < 32 || value.contains(' ')) return false;
    return RegExp(r'^[A-Za-z0-9+/=]+$').hasMatch(value);
  }

  Future<void> _playAudioBytes(List<int> bytes, {String? contentType}) async {
    final directory = await getTemporaryDirectory();
    final extension =
        contentType?.toLowerCase().contains('wav') == true ? 'wav' : 'mp3';
    final file = File(
      '${directory.path}${Platform.pathSeparator}viettel_tts_${DateTime.now().millisecondsSinceEpoch}.$extension',
    );
    await file.writeAsBytes(bytes, flush: true);
    await _player.setFilePath(file.path);
    await _player.play();
  }

  Future<void> dispose() => _player.dispose();
}
