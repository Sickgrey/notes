import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notes/models/note.dart';

class DatabaseService {
  final CollectionReference notes =
      FirebaseFirestore.instance.collection('notes');

  Future addOrUpdateNote(Notes notesList, String uid) async {
    return await notes.doc(uid).set(notesList.toMap());
  }

  // TODO: rebuild getNotes()
  /*
  Stream<List<Note>> getNotes(String uid) {
    Query query = notes.where('uid', isEqualTo: uid);
    var s = query.snapshots().map((QuerySnapshot data) =>
        data.docs.map((DocumentSnapshot data) => data.data()));
    var s = await docRef.get().then((doc) => doc.data());
    List d = s.values.toList();
    // List<Note>
    var list = d.map((el) => Note.fromJson(uid, el)).toList();
    return list;
  }
  */
}
