import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class custcr extends StatelessWidget {
  static const String id = 'custcr_screen';

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,

        title: Text(
          'Customer Service',
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
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.fromLTRB(10, 100, 10, 10),
            height: MediaQuery.of(context).size.height * 0.6,
            width: double.infinity,
            decoration: new BoxDecoration(
              borderRadius: new BorderRadius.circular(10.0),
              color: Color(0xffE8E8E8),
            ),
            margin: EdgeInsets.all(27),
            child: Column(
              children: [
                Text(
                  '  \"If by mistake ,you have deleted your content ,mail us your query at aviaxxx@gmail.com "\ ',
                  style: GoogleFonts.roboto(
                      fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Thank you for Choosing Mystiko',
                  style: GoogleFonts.roboto(fontSize: 17.0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
