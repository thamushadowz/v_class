import 'dart:convert';

ClassroomDetailsModel classroomDetailsModelFromJson(String str) =>
    ClassroomDetailsModel.fromJson(json.decode(str));

String classroomDetailsModelToJson(ClassroomDetailsModel data) =>
    json.encode(data.toJson());

class ClassroomDetailsModel {
  ClassroomDetailsModel({
    num? id,
    String? layout,
    String? name,
    num? size,
    dynamic subject,
  }) {
    _id = id;
    _layout = layout;
    _name = name;
    _size = size;
    _subject = subject;
  }

  ClassroomDetailsModel.fromJson(dynamic json) {
    _id = json['id'];
    _layout = json['layout'];
    _name = json['name'];
    _size = json['size'];
    _subject = json['subject'];
  }

  num? _id;
  String? _layout;
  String? _name;
  num? _size;
  dynamic _subject;

  ClassroomDetailsModel copyWith({
    num? id,
    String? layout,
    String? name,
    num? size,
    dynamic subject,
  }) =>
      ClassroomDetailsModel(
        id: id ?? _id,
        layout: layout ?? _layout,
        name: name ?? _name,
        size: size ?? _size,
        subject: subject ?? _subject,
      );

  num? get id => _id;
  String? get layout => _layout;
  String? get name => _name;
  num? get size => _size;

  dynamic get subject => _subject;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['layout'] = _layout;
    map['name'] = _name;
    map['size'] = _size;
    map['subject'] = _subject;
    return map;
  }
}
