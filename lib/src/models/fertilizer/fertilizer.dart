class Fertilizer {
  Fertilizer(
      {this.name,
      this.quantityapplied,
      this.dateofapp,
      this.fiid,
      this.appmethod});

  String? name;
  String? quantityapplied;
  String? appmethod;
  String? dateofapp;
  String? fiid;

  factory Fertilizer.fromJson(Map<String, dynamic> json,
      {required String fiid}) {
    final n = json['name'];
    final q = json['quantityapplied'];
    final apm = json['appmethod'];
    final date = json['dateofapp'];

    return Fertilizer(
        appmethod: apm,
        dateofapp: date,
        fiid: fiid,
        name: n,
        quantityapplied: q);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['quantityapplied'] = quantityapplied;
    data['appmethod'] = appmethod;
    data['dateofapp'] = dateofapp;
    data['name'] = name;
    return data;
  }
}
