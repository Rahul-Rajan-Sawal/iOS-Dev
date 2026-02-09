import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/encryption_util.dart';
import 'package:flutter_application_1/common/progress_dialogue.dart';
 
class CommonUtil {
  static void show(BuildContext context, {String message = "Please wait..."}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      useRootNavigator: true,
      builder: (_) => ProgressDialogWidget(message: message),
    );
  }
 
  static void hide(BuildContext context) {
    if (Navigator.of(context, rootNavigator: true).canPop()) {
      Navigator.of(context, rootNavigator: true).pop();
    }
  }
 
  static String encryptIfNotEmpty(dynamic value) {
    if (value == null) return "";
    final str = value.toString().trim();
    if (str.isEmpty) return "";
    return EncryptionUtil.encrypt(str);
  }
 
  static String decryptIfNotEmpty(dynamic value) {
    if (value == null) return "";
    final str = value.toString().trim();
    if (str.isEmpty) return "";
    try {
      return EncryptionUtil.decrypt(str);
    } catch (_) {
      return str;
    }
  }
}
 
 