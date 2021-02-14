import 'package:flutter/material.dart';
import 'package:notes/models/app_user.dart';
import 'package:notes/ui/auth_page.dart';
import 'package:notes/ui/home_page.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AppUser user = Provider.of<AppUser>(context);
    final bool isLogged = user != null;
    return isLogged ? HomePage() : AuthorizationPage();
  }
}
