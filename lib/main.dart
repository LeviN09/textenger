import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:textenger/signin/signIn.dart';

import 'board/textScreen.dart';
import 'input/inputField.dart';
import './style.dart';
import './messenger.dart';
import './signin/groupSelection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  final fireauth = FirebaseAuth.instance;
  final firemsg = FirebaseMessaging.instance;

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final tec = TextEditingController();
  bool darkMode = false;

  void initState() {
    super.initState();
    widget.firemsg.getToken().then((value) => {print(value)});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: widget.fireauth.currentUser == null
          ? SignIn(darkMode, tec)
          : GroupSelection(darkMode, tec),
    );
  }
}
