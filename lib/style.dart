import 'package:flutter/material.dart';

class Style {
  Color textLight = Colors.white;
  Color textLightYou = Colors.black;

  Color textDark = Colors.white;
  Color textDarkYou = Colors.white;

  Color backLight = Colors.grey[300]!;
  Color backLightYou = Colors.blue;

  Color backDark = Colors.grey[850]!;
  Color backDarkYou = Colors.blue[900]!;

  Color backgroundLight = Colors.white;
  Color backgroundDark = Colors.black;

  TextStyle lightText(bool isYours) {
    return isYours
        ? TextStyle(fontSize: 25, color: textLight)
        : TextStyle(fontSize: 25, color: textLightYou);
  }

  TextStyle lightMini() {
    return TextStyle(fontSize: 10, color: textLightYou);
  }

  TextStyle darkText(bool isYours) {
    return isYours
        ? TextStyle(fontSize: 25, color: textDark)
        : TextStyle(fontSize: 25, color: textDarkYou);
  }

  TextStyle darkMini() {
    return TextStyle(fontSize: 10, color: textDarkYou);
  }

  BoxDecoration lightBox(isYours) {
    return BoxDecoration(
      borderRadius: isYours
          ? BorderRadius.only(
              bottomLeft: Radius.circular(10),
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10))
          : BorderRadius.only(
              bottomRight: Radius.circular(10),
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10)),
      color: isYours ? backLightYou : backLight,
    );
  }

  BoxDecoration darkBox(isYours) {
    return BoxDecoration(
      borderRadius: isYours
          ? BorderRadius.only(
              bottomLeft: Radius.circular(10),
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10))
          : BorderRadius.only(
              bottomRight: Radius.circular(10),
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10)),
      color: isYours ? backDarkYou : backDark,
    );
  }
}
