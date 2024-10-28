import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget buildText({
  required String text,
  double paddingLeft = 10.0,
  double paddingTop = 10.0,
}) {
  return Padding(
    padding: EdgeInsets.only(left: paddingLeft, top: paddingTop),
    child: Text(
      text,
      style: TextStyle(
          fontFamily: GoogleFonts.ptSans().fontFamily,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white),
      textAlign: TextAlign.left,
    ),
  );
}
