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
        body: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Tecnológico Nacional',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: kTextWhiteColor,
                      fontSize: 25.0,
                      fontStyle: FontStyle.normal,
                      letterSpacing: 2.0,
                    ),
              ),
              Text(
                'de México',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: kTextWhiteColor,
                      fontSize: 25.0,
                      fontStyle: FontStyle.normal,
                      letterSpacing: 2.0,
                    ),
              ),
            ],
          ),
          Image.asset('assets/images/logo_itiz.png', height: 80.0, width: 80.0)
        ],
      ),
    ));
  }
}
