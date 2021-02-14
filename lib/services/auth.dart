import 'package:firebase_auth/firebase_auth.dart';
import 'package:notes/models/app_user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<AppUser> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return AppUser.fromFirebase(user);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<AppUser> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return AppUser.fromFirebase(user);
    } catch (e) {
      return null;
    }
  }

  Future logOut() async {
    await _auth.signOut();
  }

  //поток изменений событий аутентификации
  Stream<AppUser> get currentUser {
    return _auth
        .authStateChanges()
        .map((User user) => user != null ? AppUser.fromFirebase(user) : null);
  }
}
