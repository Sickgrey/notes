class Note {
  String uid;
  String title;
  String body;

  Note({this.uid, this.title, this.body});

  Note.fromJson(String uid, Map<String, String> data) {
    uid = uid;
    title = data['title'];
    body = data['body'];
  }

  Map<String, dynamic> toMap() {
    return {'uid': uid, 'title': title, 'body': body};
  }
}

class Notes {
  List<Note> notes;

  Notes({this.notes});

  Map<String, dynamic> toMap() {
    return {"notes": notes.map((n) => n.toMap()).toList()};
  }
}
