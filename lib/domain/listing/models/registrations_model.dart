import 'dart:convert';

/// registrations : [{"id":2,"student":5,"subject":1},{"id":3,"student":5,"subject":2}]

RegistrationsModel registrationsModelFromJson(String str) =>
    RegistrationsModel.fromJson(json.decode(str));
String registrationsModelToJson(RegistrationsModel data) =>
    json.encode(data.toJson());

class RegistrationsModel {
  RegistrationsModel({
    List<Registrations>? registrations,
  }) {
    _registrations = registrations;
  }

  RegistrationsModel.fromJson(dynamic json) {
    if (json['registrations'] != null) {
      _registrations = [];
      json['registrations'].forEach((v) {
        _registrations?.add(Registrations.fromJson(v));
      });
    }
  }
  List<Registrations>? _registrations;
  RegistrationsModel copyWith({
    List<Registrations>? registrations,
  }) =>
      RegistrationsModel(
        registrations: registrations ?? _registrations,
      );
  List<Registrations>? get registrations => _registrations;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_registrations != null) {
      map['registrations'] = _registrations?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : 2
/// student : 5
/// subject : 1

Registrations registrationsFromJson(String str) =>
    Registrations.fromJson(json.decode(str));
String registrationsToJson(Registrations data) => json.encode(data.toJson());

class Registrations {
  Registrations({
    num? id,
    num? student,
    num? subject,
  }) {
    _id = id;
    _student = student;
    _subject = subject;
  }

  Registrations.fromJson(dynamic json) {
    _id = json['id'];
    _student = json['student'];
    _subject = json['subject'];
  }
  num? _id;
  num? _student;
  num? _subject;
  Registrations copyWith({
    num? id,
    num? student,
    num? subject,
  }) =>
      Registrations(
        id: id ?? _id,
        student: student ?? _student,
        subject: subject ?? _subject,
      );
  num? get id => _id;
  num? get student => _student;
  num? get subject => _subject;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['student'] = _student;
    map['subject'] = _subject;
    return map;
  }
}
