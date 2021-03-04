import 'package:flutter/material.dart';
import 'package:notes/models/app_user.dart';
import 'package:notes/models/note.dart';
import 'package:notes/resources/strings.dart';
import 'package:notes/services/auth.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:notes/services/database.dart';
import 'package:provider/provider.dart';

import 'add_note.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AppUser user;
  DatabaseService db = DatabaseService();
  List<Note> notes = [];

  @override
  void initState() {
    loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    user = Provider.of<AppUser>(context);
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
              color: Theme.of(context).primaryColorLight,
              child: Column(children: [
                ListTile(
                  title: Text(
                    notes[index].title,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(notes[index].body),
                )
              ]),
            );
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColorDark,
        elevation: 5,
        child: Icon(MdiIcons.pencil),
        onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => AddNote(notes))),
      ),
    );
  }

  void loadData() async {
    /*
    var stream = db.getNotes(user.id);
    stream.listen((List<Note> data) {
      setState(() {
        notes = data;
      });
    });
    */
    //var notesFromDb = await db.getNotes(user.id);
    setState(() {});
  }
}
