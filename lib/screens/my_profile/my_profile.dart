import 'package:flutter/material.dart';
import 'package:itizapp/constants.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({super.key});
  static String routeName = 'MyProfileScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
        actions: [
          InkWell(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.only(right: kDefaultPadding / 2),
              child: Row(
                children: [
                  const Icon(Icons.report_gmailerrorred_outlined),
                  kHalfWidthSizedBox,
                  Text(
                    'Reporte',
                    style: Theme.of(context).textTheme.titleSmall,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      body: Container(
        color: kOtherColor,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 150,
              decoration: const BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(kDefaultPadding * 2),
                      bottomLeft: Radius.circular(kDefaultPadding * 2))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    maxRadius: 50.0,
                    minRadius: 50.0,
                    backgroundColor: kSecondaryColor,
                    backgroundImage: AssetImage('assets/images/3177440.png'),
                  ),
                  kWidthSizedBox,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        'Carrera - | Semestre -',
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(fontSize: 14.0),
                      )
                    ],
                  )
                ],
              ),
            ),
            sizedBox,
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ProfileDetailRow(title: 'Número de Registro', value: '-'),
                ProfileDetailRow(title: 'Año académico', value: '-'),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ProfileDetailRow(title: 'Carrera', value: '-'),
                ProfileDetailRow(title: 'Número de control', value: '-'),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ProfileDetailRow(title: 'Fecha de ingreso', value: '-'),
                ProfileDetailRow(title: 'Fecha de nacimiento', value: '-'),
              ],
            ),
            const ProfileDetailColumn(title: 'Email', value: '-'),
            const ProfileDetailColumn(title: 'Nombre Completo', value: '-'),
            const ProfileDetailColumn(title: 'Teléfono Casa', value: '-'),
            const ProfileDetailColumn(title: 'Número de teléfono', value: '-')
          ],
        ),
      ),
    );
  }
}

class ProfileDetailRow extends StatelessWidget {
  const ProfileDetailRow({super.key, required this.title, required this.value});
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
          right: kDefaultPadding / 4,
          left: kDefaultPadding / 4,
          top: kDefaultPadding / 2),
      width: MediaQuery.of(context).size.width / 2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: kTextLightColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 15.0,
                      )),
              kHalfSizedBox,
              Text(value,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: kTextBlackColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 15.0,
                      )),
              kHalfSizedBox,
              SizedBox(
                width: MediaQuery.of(context).size.width / 3,
                child: const Divider(
                  thickness: 1.0,
                ),
              ),
            ],
          ),
          const Icon(
            Icons.lock_outline,
            size: 20.0,
          )
        ],
      ),
    );
  }
}

class ProfileDetailColumn extends StatelessWidget {
  const ProfileDetailColumn(
      {super.key, required this.title, required this.value});
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: kTextLightColor, fontSize: 15.0),
              ),
              kHalfSizedBox,
              Text(
                value,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: kTextBlackColor,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              kHalfSizedBox,
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.1,
                child: const Divider(
                  thickness: 1.0,
                ),
              )
            ],
          ),
          const Icon(Icons.lock_outline, size: 20.0)
        ],
      ),
    );
  }
}
