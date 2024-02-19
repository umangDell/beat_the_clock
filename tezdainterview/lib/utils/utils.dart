import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

Utils utils = Utils();

class Utils {
  /// <<< To choose screens portrait --------- >>>
  void screenPortrait() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  /// get current value
  // RxDouble latitude = 0.0.obs;
  // RxDouble longitude = 0.0.obs;

  /// <<< To get device type --------- >>>
  String getDeviceType() {
    if (Platform.isAndroid) {
      return 'Android';
    } else {
      return 'iOS';
    }
  }

  /// <<< To check email valid or not --------- >>>
  bool emailValidator(String email) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(p);
    if (regExp.hasMatch(email)) {
      return true;
    }
    return false;
  }

  /// <<< To check phone valid or not --------- >>>
  bool phoneValidator(String contact) {
    String p = r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$';
    RegExp regExp = RegExp(p);
    if (regExp.hasMatch(contact)) {
      return true;
    }
    return false;
  }

  /// <<< To check password valid or not --------- >>>
  bool passwordValidator(String contact) {
    String p = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(p);
    if (regExp.hasMatch(contact)) {
      return true;
    }
    return false;
  }

  /// <<< To check data, string, list, object are empty or not --------- >>>
  bool isValidationEmpty(String? val) {
    if (val == null || val.isEmpty || val == "null" || val == "" || val == "NULL") {
      return true;
    } else {
      return false;
    }
  }

  /// <<< To show snackBar massage  --------- >>>
  void showSnackBar({BuildContext? context, required String message, int? statusCode}) {
    //AppColors appColors = AppColors();
    Get.snackbar(
      "",
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: statusCode == 1 ? Colors.green : Color(0xFFD55959),
      titleText: const SizedBox(),
      borderRadius: 10,
      margin: const EdgeInsets.all(12),
      colorText: Colors.white,
      duration: const Duration(seconds: 3),
      isDismissible: true,
      padding: const EdgeInsets.only(bottom: 15, top: 10, left: 15, right: 15),
      dismissDirection: DismissDirection.horizontal,
      forwardAnimationCurve: Curves.easeInOut,
    );
  }

  /// <<< hide keyboard --------- >>>
  void hideKeyboard(BuildContext context) {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  /// <<< Error Massage Red color --------- >>>
  void printError(String text) {
    if (Platform.isAndroid) {
      debugPrint('\x1B[91m$text\x1B[0m');
    } else {
      debugPrint(text);
    }
  }

  /// <<< Action Massage Blue Color --------- >>>
  void printAction(String text) {
    if (Platform.isAndroid) {
      debugPrint('\x1B[94m$text\x1B[0m');
    } else {
      debugPrint(text);
    }
  }
}
