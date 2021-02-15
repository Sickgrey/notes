import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notes/models/note.dart';

class DatabaseService {
  final CollectionReference notes =
      FirebaseFirestore.instance.collection('users');

  //Future addOrUpdateNote(Note note) async {}
  // TODO: rebuild getNotes()
  Stream<List<Note>> getNotes(String author) {
    Query query;
    if (author != null) {
      query = notes.where('author', isEqualTo: author);
    } else {
      query = notes.where('isOnline', isEqualTo: true);
    }
    return query.snapshots().map((QuerySnapshot data) => data.docs
        .map((DocumentSnapshot doc) => Note.fromJson(doc.id, doc.data()))
        .toList());
  }
}
