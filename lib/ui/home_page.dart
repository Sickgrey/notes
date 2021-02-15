import 'package:flutter/material.dart';
//import 'package:notes/models/app_user.dart';
import 'package:notes/resources/strings.dart';
import 'package:notes/services/auth.dart';
//import 'package:provider/provider.dart';
import 'package:notes/resources/colors.dart';

class HomePage extends StatelessWidget {
  final List<Map<String, String>> notes = [
    {
      'title': 'First title',
      'body':
          'My first notegkfvkrvyriycvufvktuytvtvlutvltvuytblutbouytboutboutbotlutbltbltbiut'
    },
    {'title': 'Second title', 'body': 'Other note'}
  ];

  get primaryLight => null;

  @override
  Widget build(BuildContext context) {
    //AppUser user = Provider.of<AppUser>(context);

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
      body: ListView.builder(
          itemCount: notes.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 5,
              color: primaryAppLight,
              child: Column(children: [
                ListTile(
                  title: Text(
                    notes[index]['title'],
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(notes[index]['body']),
                )
              ]),
            );
          }),
    );
  }
}
