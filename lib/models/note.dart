import 'package:flutter/material.dart';

class Note {
  String uid;
  String title;
  String body;

  Note({this.uid, this.title, this.body});

  Note.fromJson(String uid, Map<String, String> data) {
    uid = uid;
    title = data['title'];
    body = data['body'];
  }
}
