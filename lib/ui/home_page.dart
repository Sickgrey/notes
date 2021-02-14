import 'package:flutter/material.dart';
import 'package:notes/resources/strings.dart';
import 'package:notes/services/auth.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(homePageTitle),
        actions: [
          IconButton(
            icon: Icon(Icons.settings, color: Colors.white),
            onPressed: AuthService().logOut,
          )
        ],
      ),
      body: Text('Home Page'),
    );
  }
}
