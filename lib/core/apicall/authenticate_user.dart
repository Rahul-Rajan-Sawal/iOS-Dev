import 'dart:convert';
import 'package:flutter_application_1/core/static_variables.dart';
import 'package:flutter_application_1/core/network/api_request_builder.dart';
import 'package:flutter_application_1/core/network/encrypted_httpservice.dart';

//import 'package:http/http.dart';

class AuthenticateUser {
  static Future<Map<String, dynamic>> login({
    required String UserId,
    required String password,
    required String appVersion,
  }) async {
    final requestJson = ApiRequestBuilder.authenticateUserWithAppVersion(
      userId: UserId,
      password: password,
      imeiString: "",
      appVersion: appVersion,
      sso: "N",
      callerId: StaticVariables.callerId,
      callerPass: StaticVariables.callerPass!,
      tokenId: StaticVariables.TokenId,
    );

    final String responseString = await EncryptedHttpservice.post(
      url: "${StaticVariables.baseUrl}/${StaticVariables.authenticateUser}",
      requestJson: requestJson,
    );

    final Map<String, dynamic> JsonResponse = jsonDecode(responseString);

    return JsonResponse;
  }
}
