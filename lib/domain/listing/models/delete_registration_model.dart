import 'dart:convert';

/// message : "Registration 4 deleted"

DeleteRegistrationModel deleteRegistrationModelFromJson(String str) =>
    DeleteRegistrationModel.fromJson(json.decode(str));
String deleteRegistrationModelToJson(DeleteRegistrationModel data) =>
    json.encode(data.toJson());

class DeleteRegistrationModel {
  DeleteRegistrationModel({
    String? message,
  }) {
    _message = message;
  }

  DeleteRegistrationModel.fromJson(dynamic json) {
    _message = json['message'];
  }
  String? _message;
  DeleteRegistrationModel copyWith({
    String? message,
  }) =>
      DeleteRegistrationModel(
        message: message ?? _message,
      );
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    return map;
  }
}
