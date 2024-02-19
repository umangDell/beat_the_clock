import 'dart:math';

import 'package:get/get.dart';
import 'package:kjbn_task/const/app_const.dart';
import '../app_repository/get_storage.dart';
import '../t.dart';

class HomeController extends GetxController {
  final random = Random();
  final getStorageData = GetStorageData();
  final CountDownController countDownController = CountDownController();

  RxBool isFirstCLick = true.obs;
  RxInt currentTimeInSecond = 0.obs;
  RxInt randomNumber = 0.obs;
  RxInt result = 2.obs;
  RxInt userWinCount = 0.obs;
  RxInt userAttempt = 0.obs;

  getUserData() {
    result.value = getStorageData.readData(GetStorageData.lastResult) ?? 2;
    userWinCount.value = getStorageData.readData(GetStorageData.userWinCount) ?? 0;
    userAttempt.value = getStorageData.readData(GetStorageData.userAttempt) ?? 0;
  }

  onUserClick() {
    if (isFirstCLick.isTrue) {
      countDownController.start();
    }
    randomNumber.value = random.nextInt(60);
    currentTimeInSecond.value = DateTime.now().second;
    if (randomNumber.value == currentTimeInSecond.value) {
      setUserWinData();
    } else {
      setUserLossData();
    }
  }

  setUserWinData() {
    result.value = 1;
    userWinCount.value++;
    countDownController.pause();
    getStorageData.saveInt(GetStorageData.userWinCount, userWinCount.value);
    getStorageData.saveInt(GetStorageData.lastResult, 1);
  }

  setUserLossData() {
    result.value = 0;
    userAttempt.value++;
    getStorageData.saveInt(GetStorageData.userAttempt, userAttempt.value);
    getStorageData.saveInt(GetStorageData.lastResult, 0);
    countDownController.restart(duration: AppConst.timeoutSecond);
  }

  onTimeOut() {
    countDownController.restart(duration: AppConst.timeoutSecond);
    setUserLossData();
  }
}
