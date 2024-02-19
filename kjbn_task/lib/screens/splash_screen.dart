import 'dart:async';

import 'package:get/get.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Get.offNamed('/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Beat The Clock',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500, color: Colors.white),
            ),
            SizedBox(height: 20),
            Icon(
              Icons.timer_outlined,
              color: Colors.white,
              size: 50,
            )
          ],
        ),
      ),
    );
  }
}
