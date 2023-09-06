import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class Cloud {

  final firestore = FirebaseFirestore.instance;
  final fireauth = FirebaseAuth.instance;

  void init(String text, String group) {

    firestore.collection('convos').doc('groups').collection(group).add({
      "id" : fireauth.currentUser!.uid,
      "user" : fireauth.currentUser!.email.toString().split("@")[0],
      "msg" : text,
      "date" : DateTime.now(),
    });
  }
  List<Msg> fromCloud = [
    Msg("a", "nem", DateTime.now(), "cso"),
    Msg("b", "nem", DateTime.now(), "csumi"),
    Msg("c", "nem", DateTime.now(), "csa"),
    Msg("a", "nem", DateTime.now(), "cso"),
    Msg("b", "nem", DateTime.now(), "csumi"),
    Msg("c", "nem", DateTime.now(), "csa"),
    Msg("a", "nem", DateTime.now(), "cso"),
    Msg("b", "nem", DateTime.now(), "csumi"),
    Msg("c", "nem", DateTime.now(), "csa"),
    Msg("a", "nem", DateTime.now(), "cso"),
    Msg("b", "nem", DateTime.now(), "csumi"),
    Msg("c", "nem", DateTime.now(), "csa"),
    Msg("a", "nem", DateTime.now(), "cso"),
    Msg("b", "nem", DateTime.now(), "csumi"),
    Msg("c", "nem", DateTime.now(), "csa"),
    Msg("a", "nem", DateTime.now(), "cso"),
    Msg("b", "nem", DateTime.now(), "csumi"),
    Msg("c", "nem", DateTime.now(), "csa"),
  ];

  void addMsg(String group) {
    firestore
        .collection("convos").doc('groups').collection(group)
        .snapshots()
        .listen((result) {
      result.docChanges.forEach((res) {
        if (res.type == DocumentChangeType.added) {
          fromCloud.add(Msg(res.doc.data().toString(), "name", DateTime.now(), "text"));
          print(res.doc.data());
        } else if (res.type == DocumentChangeType.modified) {
          print("modified");
          print(res.doc.data());
        } else if (res.type == DocumentChangeType.removed) {
          print("removed");
          print(res.doc.data());
        }
      });
    });
  }
}

class Msg {
  final String uid;
  final String name;
  final DateTime date;
  final String text;

  Msg(this.uid, this.name, this.date, this.text);
}
