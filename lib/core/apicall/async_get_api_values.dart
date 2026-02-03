import 'package:flutter_application_1/core/network/http_request_builder.dart';
import 'package:flutter_application_1/core/network/key_decryptor.dart';
import 'package:flutter_application_1/core/static_variables.dart';
import 'package:flutter_application_1/core/storage/app_preferences.dart';
import 'package:http/http.dart';

typedef ApiCallback = void Function(String result);

class AsyncGetApiValues {
  final ApiCallback callback;

  AsyncGetApiValues({required this.callback});
  Future<void> execute() async {
    String result = "Failed";

    try {
      final response = await HttpRequestBuilder.postApiRequest(
        "${StaticVariables.baseUrl}/${StaticVariables.getApiValues}",
        {},
      );

      KeyDecryptor.extractDecryptedKeys(response);
      await AppPreferences.saveKeys();

      result = "Success";
    } catch (e) {
      result = "Failed";
    }

    callback(result);
  }
}
