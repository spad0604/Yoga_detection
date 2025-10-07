import 'package:dio/dio.dart';
import 'package:flutter_starter/presenter/languages/translation_keys.g.dart';
import 'package:flutter_starter/core/error_code.dart';

abstract class BaseException<T> extends DioException implements Exception {
  @override
  // ignore: overridden_fields
  final String message;
  final String? code;
  final T? data;

  BaseException(
    this.message, {
    this.code,
    this.data,
    super.response,
    super.stackTrace,
    super.type,
    RequestOptions? requestOptions,
  }) : super(
          message: message,
          error: data,
          requestOptions: requestOptions ?? RequestOptions(path: ''),
        );

  static BaseException from(Object? error) {
    if (error is BaseException) return error;

    // Try to extract server-side code from DioException response
    if (error is DioException) {
      final resp = error.response;
      if (resp != null && resp.data != null) {
        final data = resp.data;
        try {
          int? code;
          if (data is Map && data['code'] != null) {
            code =
                (data['code'] is int) ? data['code'] as int : int.tryParse(data['code'].toString());
          } else if (resp.statusCode != null) {
            code = resp.statusCode;
          }

          if (code != null) {
            final match = ErrorCode.values
                .firstWhere((e) => e.code == code, orElse: () => ErrorCode.INTERNAL_SERVER_ERROR);
            return ServerException(match, data: data);
          }
        } catch (_) {
          // fallthrough to UnknownException
        }
      }
    }

    return UnknownException(error);
  }

  @override
  String toString() {
    return '$runtimeType'
        '('
        'message: $message'
        '${code != null ? ', code: $code' : ''}'
        '${data != null ? ', data: $data' : ''}'
        ')';
  }
}

class UnknownException extends BaseException {
  UnknownException([Object? error]) : super(LocaleKeys.Errors_AnUnknownErrorOccurred, data: error);
}

class NetworkException extends BaseException {
  NetworkException() : super(LocaleKeys.Errors_NetworkError);
}

/// Validation errors for simple input checks (email/password, etc.)
class ValidationException extends BaseException {
  ValidationException(String message) : super(message);
}

class ServerException extends BaseException {
  ServerException(ErrorCode errorCode, {dynamic data})
      : super(
          // store a localization key string that can be passed to `tr()` at display time
          _mapErrorCodeToKey(errorCode),
          code: errorCode.code.toString(),
          data: data,
        );
}

String _mapErrorCodeToKey(ErrorCode e) {
  switch (e) {
    case ErrorCode.SUCCESS:
      return 'Errors.SUCCESS';
    case ErrorCode.INVALID_PASSWORD:
      return 'Errors.INVALID_PASSWORD';
    case ErrorCode.USER_NOT_FOUND:
      return 'Errors.USER_NOT_FOUND';
    case ErrorCode.EMAIL_ALREADY_IN_USE:
      return 'Errors.EMAIL_ALREADY_IN_USE';
    case ErrorCode.INVALID_TOKEN:
      return 'Errors.INVALID_TOKEN';
    case ErrorCode.USER_ALREADY_EXISTS:
      return 'Errors.USER_ALREADY_EXISTS';
    case ErrorCode.INVALID_FORMAT:
      return 'Errors.INVALID_FORMAT';
    case ErrorCode.UNAUTHORIZED:
      return 'Errors.UNAUTHORIZED';
    case ErrorCode.ACCESS_DENIED:
      return 'Errors.ACCESS_DENIED';
    case ErrorCode.NOT_FOUND:
      return 'Errors.NOT_FOUND';
    case ErrorCode.INTERNAL_SERVER_ERROR:
      return 'Errors.INTERNAL_SERVER_ERROR';
    case ErrorCode.OTP_EXPIRED:
      return 'Errors.OTP_EXPIRED';
    case ErrorCode.OTP_INCORRECT:
      return 'Errors.OTP_INCORRECT';
  }
}
