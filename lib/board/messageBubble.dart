import 'package:flutter/material.dart';

import '../style.dart';

class Bubble extends StatelessWidget {
  final String text;
  final bool isYours;
  final bool darkMode;

  Bubble(this.text, this.isYours, this.darkMode);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          darkMode ? Style().darkBox(isYours) : Style().lightBox(isYours),
      child: Text(
        text,
        style: darkMode
            ? Style().darkText(isYours)
            : Style().lightText(isYours),
      ),
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.all(3),
      alignment: isYours ? Alignment.centerRight : Alignment.centerLeft,
    );
  }
}
