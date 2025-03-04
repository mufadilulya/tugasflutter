import 'package:flutter/material.dart';
import 'dart:async';

import 'package:pos/appcolors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.third,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Islamic \nDevelopment \nNetwork',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColor.first,
              ),
            ),
            Text(
              'Jago IT, Pinter Ngaji',
              style: TextStyle(fontSize: 16, color: AppColor.second),
            ),
          ],
        ),
      ),
    );
  }
}
