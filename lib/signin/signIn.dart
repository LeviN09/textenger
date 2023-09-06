import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../style.dart';
import './cloud.dart';
import '../messenger.dart';
import './groupSelection.dart';

class SignIn extends StatefulWidget {
  final bool darkMode;

  final fireauth = FirebaseAuth.instance;

  final TextEditingController tec;

  SignIn(this.darkMode, this.tec);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController tec01 = TextEditingController();
  final TextEditingController tec02 = TextEditingController();
  String label = "Kérlek jelentkezz be, vagy ha még nincs fiókod, regisztrálj!";

  void sign() async {
    print(tec01.text + " " + tec02.text);
    await widget.fireauth
        .signInWithEmailAndPassword(email: tec01.text, password: tec02.text);
    if (widget.fireauth.currentUser != null) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
            builder: (context) =>
                GroupSelection(widget.darkMode, widget.tec)),
        (Route<dynamic> route) => false,
      );
    }
  }

  void reg() async {
    await widget.fireauth.createUserWithEmailAndPassword(
        email: tec01.text, password: tec02.text);

    if (widget.fireauth.currentUser != null) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
            builder: (context) =>
                GroupSelection(widget.darkMode, widget.tec)),
        (Route<dynamic> route) => false,
      );
    }
  }

  void sout() async {
    await widget.fireauth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Flexible(
              child: Container(
                child: Text(
                  label,
                  style: widget.darkMode
                      ? Style().darkText(true)
                      : Style().lightText(false),
                  textAlign: TextAlign.center,
                ),
                padding: EdgeInsets.all(10),
              ),
              flex: 2,
            ),
            Flexible(
              child: Text(
                "E-mail",
                style: widget.darkMode
                    ? Style().darkText(true)
                    : Style().lightText(false),
              ),
              flex: 1,
            ),
            Flexible(
              child: TextField(
                controller: tec01,
              ),
              flex: 1,
            ),
            Flexible(
              child: Text(
                "Jelszó",
                style: widget.darkMode
                    ? Style().darkText(true)
                    : Style().lightText(false),
              ),
              flex: 1,
            ),
            Flexible(
              child: TextField(
                controller: tec02,
              ),
              flex: 1,
            ),
            Flexible(
              child: Row(
                children: [
                  Flexible(
                    child: ElevatedButton(
                      onPressed: sign,
                      child: Text(
                        "Sign In",
                        style: widget.darkMode
                            ? Style().darkText(true)
                            : Style().lightText(false),
                      ),
                    ),
                    flex: 1,
                  ),
                  Flexible(
                    child: ElevatedButton(
                      onPressed: reg,
                      child: Text(
                        "Register",
                        style: widget.darkMode
                            ? Style().darkText(true)
                            : Style().lightText(false),
                      ),
                    ),
                    flex: 1,
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
              flex: 1,
            ),
            Flexible(
              child: ElevatedButton(
                onPressed: sout,
                child: Text(
                  "Sign Out",
                  style: widget.darkMode
                      ? Style().darkText(true)
                      : Style().lightText(false),
                ),
              ),
              flex: 1,
            )
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: widget.darkMode ? Style().backDark : Style().backLight),
      ),
    );
  }
}
