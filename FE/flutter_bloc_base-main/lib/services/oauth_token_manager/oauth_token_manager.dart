abstract class OauthTokenManager {
  const OauthTokenManager();

  Future<Map<String, dynamic>?> getAuthenticatedHeaders(Map<String, dynamic> headers);

  Future<String?> getAccessToken();

  Future<String?> getRefreshToken();

  Future<void> saveAccessToken(String? token);

  Future<void> saveRefreshToken(String? token);

  Future<void> removeAllTokens();

  Future<void> isFirstLaunch(bool isFirstLaunch);

  Future<bool> getIsFirstLaunch();
}
