import 'package:flutter/material.dart';
import 'package:itizapp/constants.dart';
import 'package:itizapp/screens/login_screen/login_screen.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = 'SplashScreen';

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushNamedAndRemoveUntil(
          context, LoginScreen.routeName, (route) => false);
    });

    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [],
              ),
              Image.asset('assets/images/logo_isc.png',
                  height: 300.0, width: 300.0)
            ],
          ),
        ));
  }
}
