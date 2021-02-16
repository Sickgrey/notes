import 'package:flutter/material.dart';
import 'package:notes/components/notes_list.dart';
import 'package:notes/resources/strings.dart';
import 'package:notes/services/auth.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'add_note.dart';

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
      body: NotesList(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColorDark,
        elevation: 5,
        child: Icon(MdiIcons.pencil),
        onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => AddNote())),
      ),
    );
  }
}
