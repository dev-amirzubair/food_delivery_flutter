// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:food_delivery/app/constants/colors.dart';
import 'package:food_delivery/app/routes/routes.dart';
import 'package:food_delivery/app/utils/utils.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _progress = 0.0;
  bool isLoggedIn = false;
  @override
  void initState() {
    super.initState();
    _startLoading();
  }

  Future<void> _startLoading() async {
    for (int i = 0; i <= 100; i++) {
      await Future.delayed(Duration(milliseconds: 30));
      setState(() {
        _progress = i / 100;
      });
    }
    isLoggedIn = await Utils.checkLoginStatus();
    Navigator.pushReplacementNamed(
        context, isLoggedIn ? RouteName.home : RouteName.login);
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: theme.primary,
      body: Stack(fit: StackFit.expand, children: [
        Image.asset(
          'assets/imgs/splash_background.png',
          fit: BoxFit.cover,
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset('assets/imgs/splash.png',
                    width: 200, height: 150, fit: BoxFit.cover),
              ),
              SizedBox(height: 160),
              Text(
                'Please Wait...',
                style: TextStyle(color: AppColors.primaryColor, fontSize: 24),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: 200,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: LinearProgressIndicator(
                    value: _progress,
                    minHeight: 10,
                    backgroundColor: AppColors.whiteLight,
                    color: AppColors.green,
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
