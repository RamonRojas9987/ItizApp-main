import 'package:flutter/cupertino.dart';
import 'package:itizapp/screens/home_screen/home_screen.dart';
import 'package:itizapp/screens/login_screen/login_screen.dart';
import 'package:itizapp/screens/my_profile/my_profile.dart';
import 'package:itizapp/screens/notification_screen/notification_screen.dart';
import 'package:itizapp/screens/proccess_screen/proccess_screen.dart';
import 'package:itizapp/screens/splash_screen/splash_screen.dart';

Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  LoginScreen.routeName: (context) => const LoginScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
  MyProfileScreen.routeName: (context) => const MyProfileScreen(),
  NotificationScreen.routeName: (context) => const NotificationScreen(),
  Proccess_Screen.routeName: (context) => const Proccess_Screen()
};
