import 'dart:io';

import 'package:flutter_starter/core/exception.dart';
import 'package:flutter_starter/core/error_code.dart';
import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter_starter/services/oauth_token_manager/oauth_token_manager.dart';

@singleton
class NetworkDio extends DioForNative implements Interceptor {
  final OauthTokenManager _tokenManager;
  Future<Map<String, String?>>? _refreshFuture;

  NetworkDio._(this._tokenManager, BaseOptions options) : super(options);

  @factoryMethod
  factory NetworkDio({
    required OauthTokenManager tokenManager,
    @Named('baseUrl') required String baseUrl,
  }) {
    final BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      contentType: 'application/json; charset=utf-8',
      connectTimeout: const Duration(seconds: 300),
      receiveTimeout: const Duration(seconds: 300),
      sendTimeout: const Duration(minutes: 5),
    );

    final instance = NetworkDio._(tokenManager, options);

    // Add the auth interceptor (this) and a log interceptor for debugging requests/responses
    instance.interceptors.add(instance);
    instance.interceptors.add(LogInterceptor(
      request: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
    ));

    return instance;
  }

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    try {
      final path = options.path.toLowerCase();
      final publicPaths = [
        'api/auth/login',
        'api/auth/register',
        'api/auth/refresh',
        'api/password/send-otp',
        'api/password/verify-otp',
      ];

      final isPublic = publicPaths.any((p) => path.contains(p));

      if (isPublic) {
        return handler.next(options);
      }
    } catch (_) {}

    return handler.next(options.copyWith(
      headers: await _tokenManager.getAuthenticatedHeaders(options.headers),
    ));
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    // TODO: Saving access token after logging in
    // if (response.requestOptions.path.endsWith(NetworkUrls.login) && response.data['access-token'] != null) {
    //   await _tokenManager.saveAccessToken(response.data['access-token']);
    // }

    return handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final errorType = err.type;
    final responseData = err.response?.data;

    if (err.error is SocketException ||
        errorType == DioExceptionType.connectionTimeout ||
        errorType == DioExceptionType.receiveTimeout ||
        errorType == DioExceptionType.sendTimeout) {
      return handler.next(NetworkException());
    }

    // Refresh the token when it expires (401)
    final requestPath = err.requestOptions.path.toLowerCase();
    final isRefreshRequest = requestPath.contains('api/auth/refresh');
    final hasRetried = err.requestOptions.extra['authRetried'] == true;

    if (err.response?.statusCode == 401 && !isRefreshRequest && !hasRetried) {
      try {
        final refreshToken = await _tokenManager.getRefreshToken();
        if (refreshToken == null || refreshToken.isEmpty) {
          await _tokenManager.removeAllTokens();
          return handler.next(ServerException(ErrorCode.UNAUTHORIZED,
              data: err.response?.data));
        }

        final tokens = await _refreshTokens(refreshToken);
        final newAccess = tokens['accessToken'];
        final newRefresh = tokens['refreshToken'];

        if (newAccess != null && newAccess.isNotEmpty) {
          await _tokenManager.saveAccessToken(newAccess);
          if (newRefresh != null && newRefresh.isNotEmpty) {
            await _tokenManager.saveRefreshToken(newRefresh);
          }

          // retry original request with new auth header
          final opts = err.requestOptions;
          final updatedHeaders =
              await _tokenManager.getAuthenticatedHeaders(opts.headers);

          final retryResponse = await request(
            opts.path,
            data: opts.data,
            queryParameters: opts.queryParameters,
            options: Options(
              method: opts.method,
              headers: updatedHeaders,
              contentType: opts.contentType,
              responseType: opts.responseType,
              extra: {
                ...opts.extra,
                'authRetried': true,
              },
            ),
            cancelToken: opts.cancelToken,
            onReceiveProgress: opts.onReceiveProgress,
            onSendProgress: opts.onSendProgress,
          );

          return handler.resolve(retryResponse);
        }

        // Refresh failed
        await _tokenManager.removeAllTokens();
        return handler.next(
            ServerException(ErrorCode.UNAUTHORIZED, data: err.response?.data));
      } catch (e) {
        await _tokenManager.removeAllTokens();
        return handler.next(BaseException.from(e));
      }
    }

    if (responseData is! Map) {
      return handler.next(err);
    }

    // TODO: Removing access token after logging out
    // if (err.response?.statusCode == 401 || responseData['messageCode'] == UnauthorizedException.messageCode) {
    //   await _tokenManager.removeAllTokens();
    //   return handler.next(UnauthorizedException(data: err.response?.data));
    // }

    // TODO: Handling global exception, such as maintainance, etc.

    return handler.next(err);
  }

  Future<Map<String, String?>> _refreshTokens(String refreshToken) {
    final inFlight = _refreshFuture;
    if (inFlight != null) {
      return inFlight;
    }

    final future = _requestRefreshTokens(refreshToken);
    _refreshFuture = future;

    return future.whenComplete(() {
      _refreshFuture = null;
    });
  }

  Future<Map<String, String?>> _requestRefreshTokens(
      String refreshToken) async {
    // Use a fresh Dio instance without interceptors to call refresh endpoint.
    final Dio refreshDio = Dio(BaseOptions(
      baseUrl: options.baseUrl,
      contentType: 'application/json; charset=utf-8',
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    ));

    final refreshResponse = await refreshDio.post(
      'api/auth/refresh',
      data: {'refreshToken': refreshToken},
    );

    final body = refreshResponse.data;
    final data =
        body is Map && body['data'] is Map ? body['data'] as Map : body;

    if (data is! Map) {
      throw ServerException(ErrorCode.UNAUTHORIZED, data: body);
    }

    return {
      'accessToken': data['accessToken']?.toString(),
      'refreshToken': data['refreshToken']?.toString(),
    };
  }
}
