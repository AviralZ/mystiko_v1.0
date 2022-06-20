import 'package:flutter/material.dart';
import 'package:password/AfterRegistration_screens/firstscreen.dart';

import 'package:password/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:password/display/welcome_screen.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:/demo/check/Cred.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = '';
  String msg = '';
  String password = '';
  bool value = false;
  final _auth = FirebaseAuth.instance;
  bool showspinner = false;

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(msg),
      content: Text("Try Again"),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
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
      body: ModalProgressHUD(
        inAsyncCall: showspinner,
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 37.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Hero(
                    tag: 'logo',
                    child: Container(
                      height: 200.0,
                      child: Image.asset('images/logo.png'),
                    ),
                  ),
                  SizedBox(
                    height: 48.0,
                  ),
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      email = value;
                      //Do something with the user input.
                    },
                    decoration: kTextFieldDecoration.copyWith(
                        hintText: 'Enter your Email'),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextField(
                    obscureText: true,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      //Do something with the user input.
                      password = value;
                    },
                    decoration: kTextFieldDecoration.copyWith(
                        hintText: 'Enter your password'),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  ElevatedButton(
                    style: raisedButtonStyle,
                    onPressed: () async {
                      setState(() {
                        showspinner = true;
                      });

                      try {
                        final newuser = await _auth.signInWithEmailAndPassword(
                            email: email, password: password);

                        if (newuser != null) {
                          // Navigator.pushNamed(context, firstscreen.id);
                          Navigator.pushNamed(context, firstscreen.id);

                          setState(() {
                            showspinner = false;
                          });
                        }
                      } catch (e) {
                        print(email);
                        print(password);
                        // print(e);
                        msg = 'Error Detected';
                        showAlertDialog(context);
                        setState(() {
                          showspinner = false;
                        });
                      }
                    },
                    child: Text('Login'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
