// @dart=2.9

import 'package:flutter/material.dart';
// import 'package:demo/screens/home.dart';
import 'package:password/display/login_screen.dart';
import 'package:password/display/registeration.dart';
import 'package:password/display/welcome_screen.dart';
import 'package:password/display/welcome_screen.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:password/AfterRegistration_screens/firstscreen.dart';
import 'package:password/AfterRegistration_screens/oneclass.dart';

import 'AfterRegistration_screens/customercare.dart';

// void main() {
//   runApp(MyApp());
// }
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        firstscreen.id: (context) => firstscreen(),
        Home.id: (context) => Home(),
        custcr.id: (context) => custcr(),
      },
    );
  }
}
