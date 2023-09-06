import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import '../messenger.dart';
import '../style.dart';

class GroupSelection extends StatefulWidget {
  final bool darkMode;
  final TextEditingController tecthis;

  GroupSelection(this.darkMode, this.tecthis);

  @override
  _GroupSelectionState createState() => _GroupSelectionState();
}

class _GroupSelectionState extends State<GroupSelection> {
  final TextEditingController tec = TextEditingController();
  String text = "Csoport neve";

  onPressed() {
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) => Messenger(widget.darkMode, widget.tecthis,
              tec.text.toUpperCase(), tec.text)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            children: [
              Text(
                text,
                style: widget.darkMode
                    ? Style().darkText(true)
                    : Style().lightText(false),
              ),
              TextField(
                controller: tec,
              ),
              ElevatedButton(
                  onPressed: onPressed,
                  child: Text(
                    "Go",
                    style: widget.darkMode
                        ? Style().darkText(true)
                        : Style().lightText(false),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
