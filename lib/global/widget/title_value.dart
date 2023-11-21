import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget noActivityText() {
  return Center(
      child: Text(
    "No activity found",
    style: GoogleFonts.montserrat(
      fontWeight: FontWeight.w400,
      fontSize: 14,
      color: Colors.black,
    ),
  ));
}

Widget titleValueWidget(String title, String value, {double fontSize = 16}) {
  return Row(
    children: [
      Text(
        title,
        overflow: TextOverflow.ellipsis,
        style: GoogleFonts.montserrat(
          fontSize: fontSize,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
      const SizedBox(
        width: 10,
      ),
      Expanded(
        child: Text(
          overflow: TextOverflow.ellipsis,
          value,
          style: GoogleFonts.montserrat(
            fontSize: fontSize,
            color: Colors.black,
          ),
        ),
      ),
    ],
  );
}

Widget titleDescriptionWidget(String title, String value) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Text(
        title,
        overflow: TextOverflow.ellipsis,
        style: GoogleFonts.montserrat(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
      const SizedBox(
        width: 10,
      ),
      Text(
        value,
        textAlign: TextAlign.left,
        style: GoogleFonts.montserrat(
          fontSize: 16,
          color: Colors.black,
        ),
      ),
    ],
  );
}
