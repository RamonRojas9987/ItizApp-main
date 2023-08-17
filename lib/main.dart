import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:itizapp/constants.dart';
import 'package:itizapp/presentation/blocs/notifications/notifications_bloc.dart';
import 'package:itizapp/routes.dart';
import 'package:itizapp/screens/splash_screen/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  await NotificationsBloc.initializeFCM();
  await dotenv.load(fileName: '.env');

  runApp(MultiBlocProvider(providers: [
    BlocProvider<NotificationsBloc>(create: (_) => NotificationsBloc())
  ], child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ITIZApp',
      theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          primaryColor: kPrimaryColor,
          appBarTheme: const AppBarTheme(
            color: kPrimaryColor,
            elevation: 0,
          ),
          textTheme:
              GoogleFonts.sourceSansProTextTheme(Theme.of(context).textTheme)
                  .apply()
                  .copyWith(
                    bodyLarge: const TextStyle(
                        color: kTextWhiteColor,
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold),
                    bodyMedium: const TextStyle(
                      color: kTextWhiteColor,
                      fontSize: 28.0,
                    ),
                    titleMedium: const TextStyle(
                        color: kTextWhiteColor,
                        fontSize: 22.0,
                        fontWeight: FontWeight.w500),
                    titleSmall: const TextStyle(
                        color: kTextWhiteColor,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w300),
                  ),
          inputDecorationTheme: const InputDecorationTheme(
            labelStyle:
                TextStyle(fontSize: 15.0, color: kTextLightColor, height: 0.5),
            hintStyle:
                TextStyle(fontSize: 16.0, color: kTextBlackColor, height: 0.5),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: kTextLightColor, width: 0.7),
            ),
            border: UnderlineInputBorder(
                borderSide: BorderSide(color: kTextLightColor)),
            disabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: kTextLightColor)),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: kPrimaryColor, width: 0.7)),
            errorBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: kErrorBorderColor, width: 1.2)),
            focusedErrorBorder: UnderlineInputBorder(
                borderSide: BorderSide(
              color: kErrorBorderColor,
              width: 1.2,
            )),
          )),
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}
