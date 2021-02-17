import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notes/models/note.dart';

class DatabaseService {
  final CollectionReference notes =
      FirebaseFirestore.instance.collection('notes');
  Notes notesList;

  Future addOrUpdateNote(Notes notesList, String uid) async {
    // TODO: create list

    return await notes.doc(uid).set(notesList.toMap());
  }

  // TODO: rebuild getNotes()
  Stream<List<Note>> getNotes(String uid) {
    return notes.snapshots().map((QuerySnapshot data) => data.docs
        .map((DocumentSnapshot doc) => Note.fromJson(doc.id, doc.data()))
        .toList());
  }
}
