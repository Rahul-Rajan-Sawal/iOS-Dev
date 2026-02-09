
import 'dart:convert';
import 'package:flutter_application_1/common/encryption_util.dart';
import 'package:flutter_application_1/core/static_variables.dart';
import 'package:dio/dio.dart';
import 'package:flutter_application_1/core/network/dio_client.dart';




class  EncryptedHttpservice{


  static Future<String>post({
    required String url,
    required Map<String, dynamic> requestJson,

  })async{
    try{
      final encryptedJson = EncryptionUtil.encrypt(jsonEncode(requestJson));

      final payload = {"jsonInput":encryptedJson};
      
      final response = await DioClient.instance.post(
        url,
        data:jsonEncode(payload),
        options: Options(
          headers: {"authorization" : StaticVariables.authorization},
        ),
      );

      final decrypted = EncryptionUtil.decrypt(response.data.toString());

      print("Decrypt: $decrypted");

      return decrypted;
    } catch(e){
      print("Error: $e");
      rethrow;
    }
  }
}

