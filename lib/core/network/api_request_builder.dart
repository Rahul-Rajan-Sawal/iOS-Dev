import 'dart:convert';

class ApiRequestBuilder {
  static String authenticateUserWithAppVersionn({
    required String userId,
    required String password,
    required String imeiString,
    required String appVersion,
    required String sso,
    required String callerId,
    required String callerPass,
    required String tokenId,
  }) {
    return jsonEncode({
      "UserId": userId,
      "Password": password,
      "IMEIstring": imeiString,
      "AppVersion": appVersion,
      "SSO": sso,
      "CallerId": callerId,
      "CallerPass": callerPass,
      "TokenId": tokenId,
    });
  }

  static Map<String, dynamic> authenticateUserWithAppVersion({
    required String userId,
    required String password,
    required String imeiString,
    required String appVersion,
    required String sso,
    required String callerId,
    required String callerPass,
    required String tokenId,
  }) {
    return {
      "UserId": userId,
      "Password": password,
      "IMEIstring": imeiString,
      "AppVersion": appVersion,
      "SSO": sso,
      "CallerId": callerId,
      "CallerPass": callerPass,
      "TokenId": tokenId,
    };
  }
}
