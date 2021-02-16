import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notes/models/note.dart';

class DatabaseService {
  final CollectionReference notes =
      FirebaseFirestore.instance.collection('notes');

  Future addOrUpdateNote(Note note) async {
    // TODO: create list
    return await notes.doc(note.uid).set(note.toMap());
  }

  // TODO: rebuild getNotes()
  Stream<List<Note>> getNotes(String uid) {
    return notes.snapshots().map((QuerySnapshot data) => data.docs
        .map((DocumentSnapshot doc) => Note.fromJson(doc.id, doc.data()))
        .toList());
  }
}
