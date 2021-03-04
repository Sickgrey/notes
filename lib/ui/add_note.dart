import 'package:flutter/material.dart';
import 'package:notes/models/app_user.dart';
import 'package:notes/models/note.dart';
import 'package:notes/services/database.dart';
import 'package:provider/provider.dart';

class AddNote extends StatefulWidget {
  final List<Note> notes;
  AddNote(this.notes);
  @override
  _AddNoteState createState() => _AddNoteState(notes);
}

class _AddNoteState extends State<AddNote> {
  AppUser user;
  final TextEditingController title = TextEditingController();
  final TextEditingController body = TextEditingController();
  List<Note> notes;

  _AddNoteState(this.notes);

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
    return ElevatedButton(
      style:
          ElevatedButton.styleFrom(primary: Theme.of(context).primaryColorDark),
      child: Text('SAVE'),
      onPressed: () => _saveNote(),
    );
  }

  void _saveNote() async {
    Note note = Note(uid: user.id, title: title.text, body: body.text);

    setState(() {
      notes.add(note);
    });
    //notes.add(note);

    await DatabaseService().addOrUpdateNote(Notes(notes: notes), user.id);
    Navigator.of(context).pop();
  }
}
