class NotesModel {
  NotesModel({this.nid, this.title, this.body, this.time, this.date});

  String? nid;
  String? title;
  String? body;
  String? time;
  String? date;

  factory NotesModel.fromJson(Map<String, dynamic> json,
      {required String nid}) {
    final t = json['title'];
    final b = json['body'];
    final time = json['time'];
    final d = json['date'];

    return NotesModel(nid: nid, body: b, date: d, time: time, title: t);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['title'] = title;
    data['body'] = body;
    data['time'] = time;
    data['date'] = date;
    return data;
  }
}
