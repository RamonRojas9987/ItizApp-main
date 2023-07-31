import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:itizapp/components/custom_buttons.dart';
import 'package:itizapp/screens/home_screen/home_screen.dart';
import 'package:logger/logger.dart';

import '../../constants.dart';

late bool _passwordVisible;
var logger = Logger();

class LoginScreen extends StatefulWidget {
  static String routeName = 'LoginScreen';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? errorText;
  String? emailError;
  String? passwordError;
  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // validar formulario
  final _formKey = GlobalKey<FormState>();

  //cambia el estado actual
  @override
  void initState() {
    super.initState();
    _passwordVisible = true;
  }

  //Login fuction
  Future<User?> loginUsingEmailPassword(
      {required String email,
      required String password,
      required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      setState(() {
        if (e.code == 'user-not-found') {
          errorText = 'Correo inválido';
        } else if (e.code == 'wrong-password') {
          errorText = 'Contraseña incorrecta';
        } else {
          errorText = 'Ocurrió un error al iniciar sesión';
        }
      });
    } catch (e) {
      setState(() {
        errorText = 'Ocurrión un error al iniciar sesión, verifica tu correo y contraseña';
      });
    }
    return user;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initializeFirebase(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return GestureDetector(
              onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
              child: Scaffold(
                  body: ListView(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 2.8,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/logo_itiz.png',
                          height: 150.0,
                          width: 150.0,
                        ),
                        const SizedBox(
                          height: kDefaultPadding / 2,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '¡Bienvenido!',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(fontWeight: FontWeight.w100),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: kDefaultPadding / 6,
                        ),
                        Text('Ingresa para continuar',
                            style: Theme.of(context).textTheme.titleSmall)
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(kDefaultPadding * 3),
                        topRight: Radius.circular(kDefaultPadding * 3),
                      ),
                      color: kOtherColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(kDefaultPadding),
                      child: Column(
                        children: [
                          Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                sizedBox,
                                EmailField(),
                                sizedBox,
                                PasswordField(),
                                if (errorText != null)
                                  Text(errorText!,
                                      style:
                                          const TextStyle(color: Colors.red)),
                                DefaultButton(
                                  onPress: () async {
                                    User? user = await loginUsingEmailPassword(
                                        email: _emailController.text,
                                        password: _passwordController.text,
                                        context: context);
                                    print(user);
                                    if (user != null) {
                                      Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                   HomeScreen()));
                                    }
                                  },
                                  title: 'Iniciar Sesión',
                                  iconData: Icons.arrow_forward_outlined,
                                ),
                                sizedBox,
                                const Align(
                                  alignment: Alignment.bottomRight,
                                  child: Text(
                                    'Olvidaste tu contraseña?',
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                        color: kPrimaryColor, fontSize: 15.0),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  TextFormField EmailField() {
    return TextFormField(
      controller: _emailController,
      textAlign: TextAlign.start,
      keyboardType: TextInputType.emailAddress,
      style: const TextStyle(
        color: kTextBlackColor,
        fontSize: 17.0,
        fontWeight: FontWeight.w300,
      ),
      decoration: const InputDecoration(
        labelText: 'Correo Institucional',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        isDense: true,
      ),
      validator: (value) {
        RegExp regExp = RegExp(emailPattern);
        if (value == null || value.isEmpty) {
          setState(() {
            errorText = 'Introduce tu correo institucional';
          });
        } else if (!regExp.hasMatch(value)) {
          setState(() {
            errorText = "Correo inválido";
          });
        } else {
          setState(() {
            errorText = null;
          });
        }
        return '';
      },
    );
  }

  TextFormField PasswordField() {
    return TextFormField(
      controller: _passwordController,
      obscureText: _passwordVisible,
      textAlign: TextAlign.start,
      keyboardType: TextInputType.visiblePassword,
      style: const TextStyle(
        color: kTextBlackColor,
        fontSize: 17.0,
        fontWeight: FontWeight.w300,
      ),
      decoration: InputDecoration(
          labelText: 'Contraseña',
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                _passwordVisible = !_passwordVisible;
              });
            },
            icon: Icon(_passwordVisible
                ? Icons.visibility_off_outlined
                : Icons.visibility_off_outlined),
            iconSize: kDefaultPadding,
          )),
      validator: (value) {
        if (value!.length < 8) {
          setState(() {
            passwordError = "La contraseña debe de tener al menos 8 caracteres";
          });
        } else {
          setState(() {
            passwordError = null;
          });
        }
        return '';
      },
    );
  }
}
