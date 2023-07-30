class Crop {
  Crop({this.cropname, this.croptype, this.plantingtime, this.cid});

  String? cropname;
  String? croptype;
  String? plantingtime;
  String? cid;

  factory Crop.fromJson(Map<String, dynamic> json, {required String cid}) {
    final cn = json['cropname'];
    final ct = json['croptype'];
    final pt = json['plantingtime'];

    return Crop(cid: cid, cropname: cn, croptype: ct, plantingtime: pt);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cropname'] = croptype;
    data['croptype'] = croptype;
    data['plantingtime'] = plantingtime;
    return data;
  }
}
