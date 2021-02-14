import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:notes/resources/colors.dart';
import 'package:notes/services/auth.dart';
import 'package:notes/ui/landing_page.dart';
import 'package:provider/provider.dart';

import 'models/app_user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<AppUser>.value(
        value: AuthService().currentUser,
        child: MaterialApp(
          theme: theme,
          home: LandingPage(),
        ));
  }
}