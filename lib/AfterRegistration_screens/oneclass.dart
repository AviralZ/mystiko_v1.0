// import 'package:flutter/material.dart';

// class oneclass extends StatefulWidget {
//   //  const oneclass({ Key? key }) : super(key: key);
//    static const String id = 'login_screen';

//   @override
//   _oneclassState createState() => _oneclassState();
// }

// class _oneclassState extends State<oneclass> {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text('One page'),
//     );
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:encrypt/encrypt.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:password/AfterRegistration_screens/add_task.dart';
import 'package:password/AfterRegistration_screens/des.dart';
import 'package:password/encryp.dart/encrpt.dart';
import 'package:flutter_string_encryption/flutter_string_encryption.dart';
import 'package:auto_size_text/auto_size_text.dart';
// import 'add_task.dart';
// import 'description.dart';

class Home extends StatefulWidget {
  static const String id = 'one_1';

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String uid = '';
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  var t2, t3;
  String t1 = '';
  String d1 = '';
  var k = 1;
  // showAlertDialog(BuildContext context) {
  //   // set up the button
  //   Widget okButton = TextButton(
  //     child: Text("Yes"),
  //     onPressed: () {
  //       key = 0;
  //       Navigator.of(context).pop();
  //     },
  //   );

  //   // set up the AlertDialog
  //   AlertDialog alert = AlertDialog(
  //     title: Text('Do you want to delete the contents'),
  //     content: Text(" "),
  //     actions: [
  //       okButton,
  //     ],
  //   );

  //   // show the dialog
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return alert;
  //     },
  //   );
  // }

  @override
  void initState() {
    getuid();
    super.initState();
  }

  void getuid() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        setState(() {
          uid = user.uid;
        });
      }
    } catch (e) {}
  }

  // Future<String> decrp(var c) async {
  //   setState(() async {
  //     t1 = await MyEncryptionDecryption.decryptAES(c);
  //     print('The next string is $t1');
  //   });
  //   return t1;
  // }

  @override
  Widget build(BuildContext context) {
    showAlertDialog(BuildContext context) {
      // set up the button
      Widget okButton = TextButton(
        child: Text("Yes"),
        onPressed: () {
          k = 0;
          Navigator.of(context).pop();
        },
      );

      // set up the AlertDialog
      AlertDialog alert = AlertDialog(
        title: Text('Do you want to delete the contents'),
        content: Text(" "),
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

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        // actions: [
        //   IconButton(
        //       icon: Icon(Icons.logout),
        //       onPressed: () async {
        //         // await FirebaseAuth.instance.signOut();

        //       }),
        // ],
        title: Text(
          'Passwords',
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
      body: Container(
        padding: EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: StreamBuilder(
          stream: _firestore
              .collection('tasks')
              .doc(uid)
              .collection('mytasks')
              .snapshots(),
          builder: (context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(
                    backgroundColor: Colors.lightBlueAccent),
              );
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              final msg = snapshot.data.docs;

              return ListView.builder(
                itemCount: msg.length,
                itemBuilder: (context, index) {
                  var time = (msg[index]['timestamp'] as Timestamp).toDate();

                  return InkWell(
                    onTap: () async {
                      var t1 = XORChiper(msg[index]['title']);
                      var d1 = XORChiper(msg[index]['description']);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Description(
                                    title: t1.toString(),
                                    description: d1.toString(),
                                  )));
                    },
                    child: Container(
                      margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      // padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          color: Color(0xffE8E8E8),
                          borderRadius: BorderRadius.circular(25.0)),
                      height: 150,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            // color: Colors.amber,
                            margin: EdgeInsets.only(left: 10),
                            child: IconButton(
                              color: Colors.deepPurpleAccent,
                              iconSize: 20,
                              onPressed: null,
                              icon: Icon(Icons.lock),
                            ),
                          ),
                          Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  child: AutoSizeText(
                                    XORChiper(msg[index]['title']),
                                    style: GoogleFonts.roboto(
                                        fontSize: 20,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                    minFontSize: 8,
                                    maxLines: 4,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                              ]),
                          Container(
                              child: IconButton(
                                  icon: Icon(Icons.delete_forever_sharp),
                                  onPressed: () async {
                                    // var c = XORChiper(msg[index]['title']);
                                    // print(c);
                                    // await showAlertDialog(context);

                                    await _firestore
                                        .collection('tasks')
                                        .doc(uid)
                                        .collection('mytasks')
                                        .doc(msg[index]['time'])
                                        .delete();
                                  }))
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
        // color: Colors.red,
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add_circle_outline_rounded, color: Colors.white),
          backgroundColor: Color(0xFF730CD2),
          onPressed: () {
            print('jugnu');

            Navigator.push(
                context, MaterialPageRoute(builder: (context) => AddTask()));
          }),
    );
  }
}
