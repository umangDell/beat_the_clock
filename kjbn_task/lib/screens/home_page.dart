import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:kjbn_task/const/app_const.dart';
import '../controller/home_controller.dart';
import '../t.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeController = Get.put(HomeController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeController.getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Beat the Clock'), centerTitle: true),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Obx(
                () => Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Current Seconds'),
                      Divider(),
                      Text("${homeController.currentTimeInSecond.value}"),
                    ],
                  ),
                ),
              ),
              Obx(
                () => Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.pinkAccent.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Random Number'),
                      Divider(),
                      Text("${homeController.randomNumber.value}"),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Obx(() => homeController.result.value == 0
              ? Container(
                  width: Get.width,
                  margin: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.yellow.withOpacity(0.5)),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(AppConst.lossMessage),
                      Divider(),
                      Text("Attempts : ${homeController.userAttempt.value.toString()}"),
                    ],
                  ),
                )
              : homeController.result.value == 1
                  ? Container(
                      width: Get.width,
                      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.green.withOpacity(0.5)),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(AppConst.winMessage),
                          Divider(),
                          Text(
                              "Score : ${homeController.userWinCount.value}/${homeController.userAttempt.value}"),
                        ],
                      ),
                    )
                  : const SizedBox.shrink()),
          CircularCountDownTimer(
            duration: AppConst.timeoutSecond,
            controller: homeController.countDownController,
            width: MediaQuery.of(context).size.width / 3,
            height: MediaQuery.of(context).size.height / 3,
            ringColor: Colors.grey[500]!,
            ringGradient: null,
            fillColor: Colors.green[500]!,
            fillGradient: null,
            backgroundColor: Colors.white,
            backgroundGradient: null,
            strokeWidth: 10.0,
            strokeCap: StrokeCap.round,
            textStyle: const TextStyle(
              fontSize: 33.0,
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
            textFormat: CountdownTextFormat.S,
            isReverse: false,
            isReverseAnimation: false,
            isTimerTextShown: true,
            autoStart: false,
            onStart: () {},
            onComplete: () {
              homeController.onTimeOut();
            },
            timeFormatterFunction: (defaultFormatterFunction, duration) {
              return (AppConst.timeoutSecond - duration.inSeconds).toString();
            },
          ),
          InkWell(
            onTap: () {
              homeController.onUserClick();
            },
            child: Container(
                height: 40,
                width: Get.width * 0.25,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.blue),
                child: Center(
                  child: Text(
                    "Click",
                    style:
                        TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
