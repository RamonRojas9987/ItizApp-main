import 'package:flutter/material.dart';
import 'package:itizapp/constants.dart';

class Proccess_Screen extends StatelessWidget {
  static String routeName = 'ProccessScreen';
  const Proccess_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'En proceso...',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: kTextWhiteColor,
                      fontSize: 25.0,
                      fontStyle: FontStyle.normal,
                      letterSpacing: 2.0,
                    ),
              )
            ],
          ),
        ],
      ),
    ));
  }
}
