import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_string_encryption/flutter_string_encryption.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:password/encryp.dart/encrpt.dart';
import 'package:encrypt/encrypt.dart';

class AddTask extends StatefulWidget {
  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  String uid = '';

  String encryptedtext = '';
  String decryptedtext = '';
  PlatformStringCryptor cryptor = PlatformStringCryptor();
  String _key = '';

  // Future<String> encrypt_text(String text) async {
  //   // cryptor = PlatformStringCryptor();
  //   // final salt = await cryptor.generateSalt();
  //   // String key = await cryptor.generateKeyFromPassword(text, salt);
  //   // String encrypted = await cryptor.encrypt(text, key);

  //   // setState(() {
  //   //   _key = key;
  //   //   encryptedtext = encrypted;
  //   // });
  //   // return encryptedtext;

  //  final plainText = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit';

  // final key = Key.fromLength(32);
  // final iv = IV.fromLength(16);
  // final encrypter = Encrypter(AES(key));

  // final encrypted = encrypter.encrypt(plainText, iv: iv);
  // final decrypted = encrypter.decrypt(encrypted, iv: iv);

  // print(decrypted);
  // print(encrypted.bytes);
  // print(encrypted.base16);
  // print(encrypted.base64);

  // }

  // Future<String> decrypt(String encryptedtext) async {
  //   try {
  //     String decrypted = await cryptor.decrypt(encryptedtext, _key);
  //     setState(() {
  //       decryptedtext = decrypted;
  //     });
  //   } on MacMismatchException {}
  //   return decryptedtext;
  // }

  addtasktofirebase() async {
    final user = _auth.currentUser;
    if (user != null) {
      uid = user.uid;
    }
    var time = DateTime.now();

    var t1 = XORChiper(titleController.text);
    var d1 = XORChiper(descriptionController.text);

    // print(' the decrpted text is $d1');
    await _firestore
        .collection('tasks')
        .doc(uid)
        .collection('mytasks')
        .doc(time.toString())
        .set({
      'title': t1.toString(),
      'description': d1.toString(),
      'time': time.toString(),
      'timestamp': time
    });
    await _firestore
        .collection('tasks_copy')
        .doc(uid)
        .collection('mytasks_copy')
        .doc(time.toString())
        .set({
      'title': t1.toString(),
      'description': d1.toString(),
      'time': time.toString(),
      'timestamp': time
    });

    Fluttertoast.showToast(msg: 'Data Added');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,

        title: Text(
          'Add Data',
          style: GoogleFonts.leckerliOne(fontSize: 30, color: Colors.white),
        ),
        elevation: 20,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        // expandedHeight: 150.0,
        // floating: true,
        // pinned: true,
        backgroundColor: Color(0xFF730CD2),
        flexibleSpace: FlexibleSpaceBar(
          background: ClipRRect(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(30),
              bottomLeft: Radius.circular(30),
            ),
          ),
        ),
      ),
      // AppBar(
      //   title: Text('New Task'),
      //   backgroundColor: Colors.pink,
      // ),
      body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(height: 60),
              Container(
                child: TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                      labelText: 'Enter Field', border: OutlineInputBorder()),
                ),
              ),
              SizedBox(height: 20),
              Container(
                child: TextField(
                  controller: descriptionController,
                  decoration: InputDecoration(
                      labelText: 'Enter Password',
                      border: OutlineInputBorder()),
                ),
              ),
              SizedBox(height: 30),
              Container(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                    style: ButtonStyle(backgroundColor:
                        MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed))
                        return Colors.purple.shade600;
                      return Color(0xFF730CD2);
                    })),
                    child: Text(
                      'Add ',
                      style: GoogleFonts.roboto(fontSize: 20),
                    ),
                    onPressed: () {
                      if ((titleController.text != '') &&
                          (descriptionController.text != '')) {
                        addtasktofirebase();
                      }
                    },
                  ))
            ],
          )),
    );
  }
}
