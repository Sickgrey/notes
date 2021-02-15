import 'package:firebase_auth/firebase_auth.dart';

class AppUser {
  String id;
  String name;
  List<Map<String, String>> notes;

  AppUser.fromFirebase(User user) {
    id = user.uid;
  }
}
