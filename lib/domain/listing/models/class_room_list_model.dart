import 'dart:convert';

/// classrooms : [{"id":1,"layout":"classroom","name":"LightSeaGreen","size":21},{"id":2,"layout":"classroom","name":"LightCyan","size":21},{"id":3,"layout":"conference","name":"BlueViolet","size":16},{"id":4,"layout":"conference","name":"PaleGreen","size":21},{"id":5,"layout":"classroom","name":"DarkSlateBlue","size":22},{"id":6,"layout":"classroom","name":"MediumSeaGreen","size":18}]

ClassRoomListModel classRoomListModelFromJson(String str) =>
    ClassRoomListModel.fromJson(json.decode(str));
String classRoomListModelToJson(ClassRoomListModel data) =>
    json.encode(data.toJson());

class ClassRoomListModel {
  ClassRoomListModel({
    List<Classrooms>? classrooms,
  }) {
    _classrooms = classrooms;
  }

  ClassRoomListModel.fromJson(dynamic json) {
    if (json['classrooms'] != null) {
      _classrooms = [];
      json['classrooms'].forEach((v) {
        _classrooms?.add(Classrooms.fromJson(v));
      });
    }
  }
  List<Classrooms>? _classrooms;
  ClassRoomListModel copyWith({
    List<Classrooms>? classrooms,
  }) =>
      ClassRoomListModel(
        classrooms: classrooms ?? _classrooms,
      );
  List<Classrooms>? get classrooms => _classrooms;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_classrooms != null) {
      map['classrooms'] = _classrooms?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : 1
/// layout : "classroom"
/// name : "LightSeaGreen"
/// size : 21

Classrooms classroomsFromJson(String str) =>
    Classrooms.fromJson(json.decode(str));
String classroomsToJson(Classrooms data) => json.encode(data.toJson());

class Classrooms {
  Classrooms({
    num? id,
    String? layout,
    String? name,
    num? size,
  }) {
    _id = id;
    _layout = layout;
    _name = name;
    _size = size;
  }

  Classrooms.fromJson(dynamic json) {
    _id = json['id'];
    _layout = json['layout'];
    _name = json['name'];
    _size = json['size'];
  }
  num? _id;
  String? _layout;
  String? _name;
  num? _size;
  Classrooms copyWith({
    num? id,
    String? layout,
    String? name,
    num? size,
  }) =>
      Classrooms(
        id: id ?? _id,
        layout: layout ?? _layout,
        name: name ?? _name,
        size: size ?? _size,
      );
  num? get id => _id;
  String? get layout => _layout;
  String? get name => _name;
  num? get size => _size;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['layout'] = _layout;
    map['name'] = _name;
    map['size'] = _size;
    return map;
  }
}
