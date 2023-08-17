import 'package:flutter_dotenv/flutter_dotenv.dart';

class Enviroment {
  static String itizAppKey = dotenv.env['ITIZ_APP_KEY'] ?? 'AIzaSyCOMwNORywitkhb2IXwNStHXLgoefrXEAI';
}
