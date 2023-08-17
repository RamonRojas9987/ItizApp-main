import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itizapp/presentation/blocs/notifications/notifications_bloc.dart';
import 'package:itizapp/screens/login_screen/login_screen.dart';
import 'package:flutter_svg/svg.dart';
import 'package:itizapp/constants.dart';
import 'package:itizapp/screens/home_screen/widgets/student_data.dart';
import 'package:itizapp/screens/my_profile/my_profile.dart';
// import 'package:itizapp/screens/my_profile/my_profile.dart';
import 'package:itizapp/screens/notification_screen/notification_screen.dart';
import 'package:itizapp/screens/proccess_screen/proccess_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static String routeName = 'HomeScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //dividiremos la pantalla en dos partes
          //altura fija para la primera mitad
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2.5,
            padding: const EdgeInsets.all(kDefaultPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        StudentName(studentName: ''),
                        kHalfSizedBox,
                        StudentCarrer(
                            studentCarrer: 'Carrera - | Semestre : -'),
                        kHalfSizedBox,
                        StudentYear(studentYear: '2023-2024')
                      ],
                    ),
                    kHalfSizedBox,
                    StudentPicture(
                        picAddress: 'assets/images/3177440.png',
                        onPress: () {
                          Navigator.pushNamed(
                              context, MyProfileScreen.routeName);
                        }),
                  ],
                ),
                sizedBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    StudentDataCard(
                        title: 'Mensajes',
                        // title: context.select((NotificationsBloc bloc) =>
                        //     bloc.state.status.toString()),
                        onPress: () {}),
                    InkWell(
                      onTap: () {
                        context.read<NotificationsBloc>().requestPermission();
                        Navigator.pushNamed(
                            context, NotificationScreen.routeName);
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2.5,
                        height: MediaQuery.of(context).size.height / 9,
                        decoration: BoxDecoration(
                          color: kOtherColor,
                          borderRadius: BorderRadius.circular(kDefaultPadding),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Notificaciones',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      fontSize: 16.0,
                                      color: kTextBlackColor,
                                      fontWeight: FontWeight.w800),
                            ),
                            Theme(
                              data: ThemeData(),
                              child: const Icon(Icons.circle_notifications),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          //otro usará toda la altura restante de la pantalla
          Expanded(
            child: Container(
              color: Colors.transparent,
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: kOtherColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(kDefaultPadding * 3),
                    topRight: Radius.circular(kDefaultPadding * 3),
                  ),
                ),
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        HomeCard(
                            onPress: () {
                              Navigator.pushNamed(
                                  context, Proccess_Screen.routeName);
                            },
                            icon: 'assets/icons/quiz.svg',
                            title: 'Actividades'),
                        HomeCard(
                            onPress: () {
                              Navigator.pushNamed(
                                  context, Proccess_Screen.routeName);
                            },
                            icon: 'assets/icons/assignment.svg',
                            title: 'Tareas'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        HomeCard(
                            onPress: () {
                              Navigator.pushNamed(
                                  context, Proccess_Screen.routeName);
                            },
                            icon: 'assets/icons/holiday.svg',
                            title: 'Calendario'),
                        HomeCard(
                            onPress: () {
                              Navigator.pushNamed(
                                  context, Proccess_Screen.routeName);
                            },
                            icon: 'assets/icons/timetable.svg',
                            title: 'Horario'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        HomeCard(
                            onPress: () {
                              Navigator.pushNamed(
                                  context, Proccess_Screen.routeName);
                            },
                            icon: 'assets/icons/result.svg',
                            title: 'Evaluaciones'),
                        HomeCard(
                            onPress: () {
                              Navigator.pushNamed(
                                  context, Proccess_Screen.routeName);
                            },
                            icon: 'assets/icons/datesheet.svg',
                            title: 'Resultados'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        HomeCard(
                            onPress: () {
                              Navigator.pushNamed(
                                  context, Proccess_Screen.routeName);
                            },
                            icon: 'assets/icons/ask.svg',
                            title: 'Información'),
                        HomeCard(
                            onPress: () {
                              Navigator.pushNamed(
                                  context, Proccess_Screen.routeName);
                            },
                            icon: 'assets/icons/gallery.svg',
                            title: 'Galería'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        HomeCard(
                            onPress: () {
                              Navigator.pushNamed(
                                  context, Proccess_Screen.routeName);
                            },
                            icon: 'assets/icons/resume.svg',
                            title: 'Servicios\n Escolares'),
                        HomeCard(
                            onPress: () {
                              Navigator.pushNamed(
                                  context, Proccess_Screen.routeName);
                            },
                            icon: 'assets/icons/lock.svg',
                            title: 'Cambiar\n contraseña'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        HomeCard(
                            onPress: () {
                              Navigator.pushNamed(
                                  context, Proccess_Screen.routeName);
                            },
                            icon: 'assets/icons/event.svg',
                            title: 'Eventos'),
                        HomeCard(
                            onPress: () async {
                              await FirebaseAuth.instance.signOut();
                              Navigator.pushReplacementNamed(
                                  context, LoginScreen.routeName);
                            },
                            icon: 'assets/icons/logout.svg',
                            title: 'Cerrar sesión'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HomeCard extends StatelessWidget {
  const HomeCard(
      {Key? key,
      required this.onPress,
      required this.icon,
      required this.title})
      : super(key: key);
  final VoidCallback onPress;
  final String icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.only(top: kDefaultPadding / 2),
        width: MediaQuery.of(context).size.width / 2.5,
        height: MediaQuery.of(context).size.height / 6,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(kDefaultPadding / 2),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(icon, height: 40, width: 40, color: kOtherColor),
            Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(
              height: kDefaultPadding / 3,
            )
          ],
        ),
      ),
    );
  }
}
