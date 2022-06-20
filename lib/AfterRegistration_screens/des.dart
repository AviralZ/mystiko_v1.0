import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Description extends StatelessWidget {
  String title = '', description = '';

  Description({required this.title, required this.description});
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,

        title: Text(
          'Password Data',
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
                Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: AutoSizeText(
                    'Field: $title',
                    style: GoogleFonts.roboto(
                        fontSize: 20, fontWeight: FontWeight.bold),
                    minFontSize: 8,
                    maxLines: 4,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: AutoSizeText(
                    'Password: $description',
                    style: GoogleFonts.roboto(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
