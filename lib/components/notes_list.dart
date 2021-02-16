import 'package:flutter/material.dart';
import 'package:notes/models/app_user.dart';
import 'package:notes/models/note.dart';
import 'package:notes/services/database.dart';
import 'package:provider/provider.dart';

class NotesList extends StatefulWidget {
  @override
  _NotesListState createState() => _NotesListState();
}

class _NotesListState extends State<NotesList> {
  AppUser user;
  DatabaseService db = DatabaseService();
  var notes = List<Note>();

  void loadData() async {
    var stream = db.getNotes(user.id);
    stream.listen((List<Note> data) {
      setState(() {
        notes = data;
      });
    });
  }

  @override
  void initState() {
    loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    user = Provider.of<AppUser>(context);
    return ListView.builder(
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
        });
  }
}
