import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:password/AfterRegistration_screens/customercare.dart';
import 'package:password/AfterRegistration_screens/firstscreen.dart';
import 'package:password/AfterRegistration_screens/oneclass.dart';
import 'package:google_fonts/google_fonts.dart';

class firstscreen extends StatelessWidget {
  static const String id = 'first_screen';
  final padding = EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Color(0xff6C35D1),
        //   elevation: 20.0,
        //   centerTitle: true,
        //   // centerTitle: false,
        //   flexibleSpace: FlexibleSpaceBar(
        //     title: Text(
        //       'Mystikó',
        //       style: GoogleFonts.cinzelDecorative(fontSize: 20),
        //     ),
        //   ),
        // ),
        // backgroundColor: Color(0xffeb445a),
        body: Center(
      child: CustomScrollView(
        // scrollDirection: Axis.horizontal,
        primary: false,
        slivers: <Widget>[
          SliverAppBar(
            elevation: 20,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            expandedHeight: 150.0,
            floating: true,
            pinned: true,
            backgroundColor: Color(0xFF730CD2),
            flexibleSpace: FlexibleSpaceBar(
              background: ClipRRect(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30)),
                // child: Image.asset(
                //   'images/logo.png',

                //   // height: 10,
                //   // wid
                //   // fit: BoxFit.values(2),
                // ),
              ),
              title: BorderedText(
                strokeWidth: 4.0,
                strokeColor: Colors.black,
                child: Text(
                  'Mystikó',
                  style: GoogleFonts.cinzelDecorative(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),

                  // Text(
                  //   "The Avi QR  ",
                  //   style: GoogleFonts.satisfy(
                  //     color: Colors.white,
                  //     fontSize: 22.0,
                  //     fontWeight: FontWeight.bold,
                  //     letterSpacing: 3,
                  //   ),
                  // ),
                ),
              ),
              centerTitle: true,
            ),

            // background: ,
          ),
          SliverPadding(
            padding: const EdgeInsets.all(40),
            sliver: SliverGrid.count(
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              crossAxisCount: 1,
              children: <Widget>[
                // TextButton(
                //   onPressed: () {
                //     // print('1');
                //     // Navigator.pushNamed(context, Timetable.id);
                //   },
                //   child: Stack(
                //     children: [
                //       Container(
                //         // color: Colors.red,
                //         // height: 400,
                //         decoration: new BoxDecoration(
                //           image: new DecorationImage(
                //             image: ExactAssetImage('images/5.jpg'),
                //             fit: BoxFit.fitHeight,
                //           ),
                //           borderRadius: BorderRadius.circular(34),
                //           color: Colors.green,
                //         ),
                //       ),
                //       Container(
                //         alignment: Alignment.center,
                //         child: Text(
                //           'Passwords',
                //           style: GoogleFonts.leckerliOne(
                //               fontSize: 30, color: Colors.white),
                //         ),
                //       )
                //     ],
                //   ),
                // ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Home.id);
                  },
                  child: Stack(
                    children: [
                      Container(
                        // height: 400,
                        decoration: new BoxDecoration(
                          image: new DecorationImage(
                            image: ExactAssetImage('images/5.jpg'),
                            // fit: BoxFit.fitWidth,
                            fit: BoxFit.fitHeight,
                          ),
                          borderRadius: BorderRadius.circular(24),
                          // color: Colors.green
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          'Password',
                          style: GoogleFonts.leckerliOne(
                              fontSize: 30, color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, custcr.id);
                  },
                  child: Stack(
                    children: [
                      Container(
                        // height: 400,
                        decoration: new BoxDecoration(
                          image: new DecorationImage(
                            image: ExactAssetImage('images/5.jpg'),
                            // fit: BoxFit.fitWidth,
                            fit: BoxFit.fitHeight,
                          ),
                          borderRadius: BorderRadius.circular(24),
                          // color: Colors.green
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          'Customer Care',
                          style: GoogleFonts.leckerliOne(
                              fontSize: 30, color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
