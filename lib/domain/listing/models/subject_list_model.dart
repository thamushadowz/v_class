import 'dart:convert';

/// subjects : [{"credits":10,"id":1,"name":"History","teacher":"Brenda Miller"},{"credits":15,"id":2,"name":"Mathematics","teacher":"Brenda Miller"},{"credits":12,"id":3,"name":"Social Science","teacher":"Jamie Holden"},{"credits":15,"id":4,"name":"Physics","teacher":"Adam Ingram"},{"credits":8,"id":5,"name":"Chemistry","teacher":"Erin Walsh"},{"credits":10,"id":6,"name":"Biology","teacher":"Pamela Fowler"}]

SubjectListModel subjectListModelFromJson(String str) =>
    SubjectListModel.fromJson(json.decode(str));
String subjectListModelToJson(SubjectListModel data) =>
    json.encode(data.toJson());

class SubjectListModel {
  SubjectListModel({
    List<Subjects>? subjects,
  }) {
    _subjects = subjects;
  }

  SubjectListModel.fromJson(dynamic json) {
    if (json['subjects'] != null) {
      _subjects = [];
      json['subjects'].forEach((v) {
        _subjects?.add(Subjects.fromJson(v));
      });
    }
  }
  List<Subjects>? _subjects;
  SubjectListModel copyWith({
    List<Subjects>? subjects,
  }) =>
      SubjectListModel(
        subjects: subjects ?? _subjects,
      );
  List<Subjects>? get subjects => _subjects;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_subjects != null) {
      map['subjects'] = _subjects?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// credits : 10
/// id : 1
/// name : "History"
/// teacher : "Brenda Miller"

Subjects subjectsFromJson(String str) => Subjects.fromJson(json.decode(str));
String subjectsToJson(Subjects data) => json.encode(data.toJson());

class Subjects {
  Subjects({
    num? credits,
    num? id,
    String? name,
    String? teacher,
  }) {
    _credits = credits;
    _id = id;
    _name = name;
    _teacher = teacher;
  }

  Subjects.fromJson(dynamic json) {
    _credits = json['credits'];
    _id = json['id'];
    _name = json['name'];
    _teacher = json['teacher'];
  }
  num? _credits;
  num? _id;
  String? _name;
  String? _teacher;
  Subjects copyWith({
    num? credits,
    num? id,
    String? name,
    String? teacher,
  }) =>
      Subjects(
        credits: credits ?? _credits,
        id: id ?? _id,
        name: name ?? _name,
        teacher: teacher ?? _teacher,
      );
  num? get credits => _credits;
  num? get id => _id;
  String? get name => _name;
  String? get teacher => _teacher;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['credits'] = _credits;
    map['id'] = _id;
    map['name'] = _name;
    map['teacher'] = _teacher;
    return map;
  }
}
