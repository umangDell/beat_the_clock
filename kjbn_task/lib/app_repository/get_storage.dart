import 'dart:convert';

import 'package:get_storage/get_storage.dart';

/// <<< To store data in phone storage --------- >>>
class GetStorageData {
  final box = GetStorage();
  static String userWinCount = "userWinCount";
  static String userAttempt = "totalAttempt";
  static String lastResult = "lastResult";

  saveInt(String key, int value) async {
    box.write(key, value);
  }

  readData(String key) {
    final box = GetStorage();
    if (box.hasData(key)) {
      return box.read(key);
    } else {
      return null;
    }
  }

/* static String token = "token";
  static String agentDetails = "agentDetails";
  static String selfDetails = "selfDetails";
  static String coveredMember = "coveredMember";

  /// <<< To save object data --------- >>>
  static saveString(String key, value) async {
    final box = GetStorage();
    return box.write(key, value);
  }

  /// <<< To read object data --------- >>>
  static readString(String key) {
    final box = GetStorage();
    if (box.hasData(key)) {
      return box.read(key);
    } else {
      return null;
    }
  }

  /// <<< To remove data --------- >>>
  static removeData(String key) async {
    final box = GetStorage();
    return box.remove(key);
  }

  /// <<< To Store Key data --------- >>>
  static bool containKey(String key) {
    final box = GetStorage();
    return box.hasData(key);
  }

  static saveObject(String key, value) {
    final box = GetStorage();
    String allData = jsonEncode(value);
    box.write(key, allData);
  }

  static readObject(String key) {
    final box = GetStorage();
    var result = box.read(key);
    return jsonDecode(result);
  }*/
}
