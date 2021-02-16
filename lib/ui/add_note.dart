import 'package:flutter/material.dart';
import 'package:notes/models/app_user.dart';
import 'package:notes/models/note.dart';
import 'package:notes/services/database.dart';
import 'package:provider/provider.dart';

class AddNote extends StatefulWidget {
  @override
  _AddNoteState createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  AppUser user;
  TextEditingController title = TextEditingController();
  TextEditingController body = TextEditingController();

  @override
  Widget build(BuildContext context) {
    user = Provider.of<AppUser>(context);
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [_textField(title), _textField(body), _button()],
          ),
        ));
  }

  Widget _textField(TextEditingController controller) {
    return TextField(
      controller: controller,
    );
  }

  Widget _button() {
    return RaisedButton(
      color: Theme.of(context).primaryColorDark,
      onPressed: () => _saveNote(),
    );
  }

  void _saveNote() async {
    Note note = Note(uid: user.id, title: title.text, body: body.text);
    await DatabaseService().addOrUpdateNote(note);
    Navigator.of(context).pop();
  }
}
