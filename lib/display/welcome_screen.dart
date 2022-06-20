import 'package:google_fonts/google_fonts.dart';
import 'package:password/display/login_screen.dart';
import 'package:password/display/registeration.dart';
import 'package:flutter/material.dart';
import 'package:password/main.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 3),
      vsync: (this),
    );
    animation = ColorTween(
      begin: Color(0xffED1C38),
      end: Color(0xfffc0526),
    ).animate(controller);
    // animation = CurvedAnimation(parent: controller, curve: Curves.bounceOut);
    controller.forward();
    // animation.addStatusListener((status) {
    //   if (status == AnimationStatus.completed) {
    //     controller.reverse(from: 1.0);
    //   } else if (status == AnimationStatus.dismissed) {
    //     controller.forward();
    //   }
    // });

    controller.addListener(() {
      setState(() {
        // print(animation.value);
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
      onPrimary: Colors.black,
      // onSurface: Colors.black,
      primary: Colors.white,
      minimumSize: Size(88, 46),
      padding: EdgeInsets.symmetric(horizontal: 20),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
    );
    return Scaffold(
      backgroundColor: Color(0xff6C35D1),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Column(
                  children: [
                    Hero(
                      tag: 'logo',
                      child: Container(
                        child: Image.asset('images/logo.png'),
                        height: 60.0,
                      ),
                    ),
                    Text(
                      'Mystikó',
                      style: GoogleFonts.cinzelDecorative(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                      '© App by Aviral ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.0,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 48.0,
                ),
                ElevatedButton(
                  style: raisedButtonStyle,
                  onPressed: () {
                    print('hello');
                    Navigator.pushNamed(context, LoginScreen.id);
                  },
                  child: Text("Login"),
                ),
                SizedBox(
                  height: 28.0,
                ),
                ElevatedButton(
                  style: raisedButtonStyle,
                  onPressed: () {
                    Navigator.pushNamed(context, RegistrationScreen.id);
                  },
                  child: Text("Register"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
