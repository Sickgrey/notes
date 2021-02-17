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
  /*
  Map<String, dynamic> toMap() =>
      notes.asMap().map((key, value) => MapEntry('$key', value));
  */
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    for (int i = 0; i < notes.length; i++) {
      map.putIfAbsent('$i', () => notes[i].toMap());
    }
    return map;
  }
}
