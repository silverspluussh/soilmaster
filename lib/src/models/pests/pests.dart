class Pests {
  Pests({this.affected, this.datenoticed, this.name, this.pid, this.solution});

  String? name;
  String? affected;
  String? datenoticed;
  String? solution;
  String? pid;

  factory Pests.fromJson(Map<String, dynamic> json, {required String pid}) {
    final n = json['name'];
    final a = json['affected'];
    final d = json['datenoticed'];
    final so = json['solution'];

    return Pests(affected: a, datenoticed: d, pid: pid, name: n, solution: so);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['name'] = name;
    data['affected'] = affected;
    data['datenoticed'] = datenoticed;
    data['solution'] = solution;
    return data;
  }
}
