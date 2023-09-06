import 'package:flutter/material.dart';

import '../style.dart';
import './messageBubble.dart';

class Message extends StatelessWidget {
  final String id;
  final String text;
  final DateTime date;
  final bool isYou;
  final bool darkMode;

  Message(this.id, this.text, this.date, this.isYou, this.darkMode);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            child: Text(
              id,
              style: darkMode ? Style().darkMini() : Style().lightMini(),
            ),
            margin: EdgeInsets.only(left: 3, top: 3),
            alignment: Alignment.topLeft,
          ),
          Bubble(text, isYou, darkMode),
          Container(
            child: Text(
              date.year.toString() +
                  "." +
                  date.month.toString() +
                  "." +
                  date.day.toString() +
                  " " +
                  date.hour.toString() +
                  ":" +
                  date.minute.toString(),
              style: darkMode ? Style().darkMini() : Style().lightMini(),
            ),
            alignment: Alignment.bottomRight,
            margin: EdgeInsets.only(right: 3, bottom: 3),
          ),
        ],
      ),
      padding: isYou ? EdgeInsets.only(left: 100) : EdgeInsets.only(right: 100),

    );
  }
}
