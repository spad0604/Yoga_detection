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

  NetworkDio._(this._tokenManager, BaseOptions options) : super(options);

  @factoryMethod
  factory NetworkDio({
    required OauthTokenManager tokenManager,
    @Named('baseUrl') required String baseUrl,
  }) {
    final BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      contentType: 'application/json; charset=utf-8',
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
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
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
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

    if (responseData is! Map) {
      return handler.next(err);
    }

    // Refresh the token when it expires (401)
    if (err.response?.statusCode == 401) {
      try {
        final refreshToken = await _tokenManager.getRefreshToken();
        if (refreshToken == null) {
          await _tokenManager.removeAllTokens();
          return handler.next(ServerException(ErrorCode.UNAUTHORIZED, data: err.response?.data));
        }

        // Use a fresh Dio instance without interceptors to call refresh endpoint
        final Dio refreshDio = Dio(BaseOptions(
          baseUrl: this.options.baseUrl,
          contentType: 'application/json; charset=utf-8',
          connectTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 30),
        ));

        final refreshResponse =
            await refreshDio.post('api/auth/refresh', data: {'refreshToken': refreshToken});

        if (refreshResponse.data is Map && refreshResponse.data['data'] is Map) {
          final data = refreshResponse.data['data'];
          final newAccess = data['accessToken']?.toString();
          final newRefresh = data['refreshToken']?.toString();

          if (newAccess != null) {
            await _tokenManager.saveAccessToken(newAccess);
            if (newRefresh != null) await _tokenManager.saveRefreshToken(newRefresh);

            // retry original request with new auth header
            final opts = err.requestOptions;
            final updatedHeaders = await _tokenManager.getAuthenticatedHeaders(opts.headers);

            final retryResponse = await refreshDio.request(
              opts.path,
              data: opts.data,
              queryParameters: opts.queryParameters,
              options: Options(method: opts.method, headers: updatedHeaders),
              cancelToken: opts.cancelToken,
              onReceiveProgress: opts.onReceiveProgress,
            );

            return handler.resolve(retryResponse);
          }
        }

        // Refresh failed
        await _tokenManager.removeAllTokens();
        return handler.next(ServerException(ErrorCode.UNAUTHORIZED, data: refreshResponse.data));
      } catch (e) {
        await _tokenManager.removeAllTokens();
        return handler.next(BaseException.from(e));
      }
    }

    // TODO: Removing access token after logging out
    // if (err.response?.statusCode == 401 || responseData['messageCode'] == UnauthorizedException.messageCode) {
    //   await _tokenManager.removeAllTokens();
    //   return handler.next(UnauthorizedException(data: err.response?.data));
    // }

    // TODO: Handling global exception, such as maintainance, etc.

    return handler.next(err);
  }
}
