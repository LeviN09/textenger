import 'package:flutter/material.dart';

import 'board/textScreen.dart';
import 'input/inputField.dart';
import './style.dart';

class Messenger extends StatelessWidget {
  final bool darkMode;
  final TextEditingController tec;
  final title;
  final String group;

  Messenger(this.darkMode, this.tec, this.title, this.group);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(
            child: TextScreen(darkMode, group),
            flex: 7,
          ),
          Flexible(
            child: InputField(darkMode, tec, group),
            flex: 1,
          )
        ],
      ),
      backgroundColor: darkMode ? Style().backDark : Style().backLight,
      appBar: AppBar(
        title: Text(title),
        backgroundColor: darkMode ? Style().backDarkYou : Style().backLightYou,
        automaticallyImplyLeading: false,
      ),
    );
  }
}
