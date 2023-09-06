import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:textenger/style.dart';
import 'package:firebase_auth/firebase_auth.dart';

import './messageBubble.dart';
import 'message.dart';
import '../signin/cloud.dart';

class TextScreen extends StatefulWidget {
  final List<Msg> texts = Cloud().fromCloud;
  final bool darkMode;
  final firestore = FirebaseFirestore.instance;
  final fireauth = FirebaseAuth.instance;
  final String group;

  TextScreen(this.darkMode, this.group);

  @override
  _TextScreenState createState() => _TextScreenState();
}

class _TextScreenState extends State<TextScreen> {
  ScrollController sc = ScrollController();
  Widget builder(BuildContext context, int i) {
    return Message(widget.texts[i].name, widget.texts[i].text,
        widget.texts[i].date, i.isOdd ? true : false, widget.darkMode);
  }

  getMsgs(AsyncSnapshot<QuerySnapshot> snapshot) {
    sc.animateTo(0, duration: Duration(milliseconds: 10), curve: Curves.easeIn);
    return snapshot.data!.docs
        .map((e) => Message(
            (e.data() as dynamic)['user'],
            (e.data() as dynamic)['msg'],
            ((e.data() as dynamic)['date']).toDate(),
            (e.data() as dynamic)['id'] == widget.fireauth.currentUser!.uid,
            widget.darkMode))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder<QuerySnapshot>(
        stream: widget.firestore
            .collection('convos')
            .doc('groups')
            .collection(widget.group)
            .orderBy('date', descending: true)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          return ListView(
            children: getMsgs(snapshot),
            reverse: true,
            controller: sc,
          );
        },
      ),
      width: double.infinity,
      color: widget.darkMode ? Style().backgroundDark : Style().backgroundLight,
    );
  }
}
