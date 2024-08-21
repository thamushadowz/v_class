import 'dart:convert';

/// students : [{"age":27,"email":"heatheredwards@example.com","id":1,"name":"Heather Edwards"},{"age":20,"email":"danielcurtis@example.com","id":2,"name":"Daniel Curtis"},{"age":20,"email":"amandareyes@example.com","id":3,"name":"Amanda Reyes"},{"age":23,"email":"barbarasanchez@example.com","id":4,"name":"Barbara Sanchez"},{"age":22,"email":"lauradixon@example.com","id":5,"name":"Laura Dixon"},{"age":20,"email":"ericalexander@example.com","id":6,"name":"Eric Alexander"},{"age":21,"email":"randyrivera@example.com","id":7,"name":"Randy Rivera"},{"age":24,"email":"josephhanna@example.com","id":8,"name":"Joseph Hanna"},{"age":30,"email":"michaellynch@example.com","id":9,"name":"Michael Lynch"},{"age":24,"email":"nicholasmoore@example.com","id":10,"name":"Nicholas Moore"},{"age":20,"email":"kevinmaldonado@example.com","id":11,"name":"Kevin Maldonado"},{"age":26,"email":"davidwilkins@example.com","id":12,"name":"David Wilkins"},{"age":25,"email":"kristinschneider@example.com","id":13,"name":"Kristin Schneider"},{"age":22,"email":"laurawalker@example.com","id":14,"name":"Laura Walker"},{"age":22,"email":"ritapatterson@example.com","id":15,"name":"Rita Patterson"},{"age":30,"email":"danward@example.com","id":16,"name":"Dan Ward"},{"age":28,"email":"anthonyroberson@example.com","id":17,"name":"Anthony Roberson"},{"age":22,"email":"billyduncan@example.com","id":18,"name":"Billy Duncan"},{"age":20,"email":"randyoliver@example.com","id":19,"name":"Randy Oliver"},{"age":25,"email":"mariaramos@example.com","id":20,"name":"Maria Ramos"},{"age":21,"email":"alexjackson@example.com","id":21,"name":"Alex Jackson"},{"age":28,"email":"jeremypierce@example.com","id":22,"name":"Jeremy Pierce"},{"age":20,"email":"brucesmall@example.com","id":23,"name":"Bruce Small"},{"age":29,"email":"gregorysmith@example.com","id":24,"name":"Gregory Smith"},{"age":21,"email":"trevorduncan@example.com","id":25,"name":"Trevor Duncan"},{"age":25,"email":"meghankim@example.com","id":26,"name":"Meghan Kim"},{"age":24,"email":"taylornelson@example.com","id":27,"name":"Taylor Nelson"},{"age":20,"email":"stephenlevine@example.com","id":28,"name":"Stephen Levine"},{"age":28,"email":"tylernguyen@example.com","id":29,"name":"Tyler Nguyen"},{"age":21,"email":"mathewmurphy@example.com","id":30,"name":"Mathew Murphy"},{"age":28,"email":"philliprubio@example.com","id":31,"name":"Phillip Rubio"},{"age":26,"email":"josephfloresjr.@example.com","id":32,"name":"Joseph Flores Jr."},{"age":24,"email":"craigfritz@example.com","id":33,"name":"Craig Fritz"},{"age":27,"email":"richardwoods@example.com","id":34,"name":"Richard Woods"},{"age":25,"email":"tylermueller@example.com","id":35,"name":"Tyler Mueller"},{"age":28,"email":"sarahday@example.com","id":36,"name":"Sarah Day"},{"age":23,"email":"christophermoore@example.com","id":37,"name":"Christopher Moore"},{"age":27,"email":"alexandermarquez@example.com","id":38,"name":"Alexander Marquez"},{"age":30,"email":"erinwilliams@example.com","id":39,"name":"Erin Williams"},{"age":25,"email":"tiffanyestes@example.com","id":40,"name":"Tiffany Estes"},{"age":29,"email":"andreamurphy@example.com","id":41,"name":"Andrea Murphy"},{"age":28,"email":"thomasfisher@example.com","id":42,"name":"Thomas Fisher"},{"age":30,"email":"danielcontreras@example.com","id":43,"name":"Daniel Contreras"},{"age":23,"email":"lauragibbs@example.com","id":44,"name":"Laura Gibbs"},{"age":23,"email":"mitchellrodriguez@example.com","id":45,"name":"Mitchell Rodriguez"},{"age":28,"email":"kevincraig@example.com","id":46,"name":"Kevin Craig"},{"age":30,"email":"brendatyler@example.com","id":47,"name":"Brenda Tyler"},{"age":28,"email":"bradleybates@example.com","id":48,"name":"Bradley Bates"},{"age":20,"email":"timothymiller@example.com","id":49,"name":"Timothy Miller"},{"age":24,"email":"josephtorres@example.com","id":50,"name":"Joseph Torres"}]

StudentListModel studentListModelFromJson(String str) =>
    StudentListModel.fromJson(json.decode(str));
String studentListModelToJson(StudentListModel data) =>
    json.encode(data.toJson());

class StudentListModel {
  StudentListModel({
    List<Students>? students,
  }) {
    _students = students;
  }

  StudentListModel.fromJson(dynamic json) {
    if (json['students'] != null) {
      _students = [];
      json['students'].forEach((v) {
        _students?.add(Students.fromJson(v));
      });
    }
  }
  List<Students>? _students;
  StudentListModel copyWith({
    List<Students>? students,
  }) =>
      StudentListModel(
        students: students ?? _students,
      );
  List<Students>? get students => _students;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_students != null) {
      map['students'] = _students?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// age : 27
/// email : "heatheredwards@example.com"
/// id : 1
/// name : "Heather Edwards"

Students studentsFromJson(String str) => Students.fromJson(json.decode(str));
String studentsToJson(Students data) => json.encode(data.toJson());

class Students {
  Students({
    num? age,
    String? email,
    num? id,
    String? name,
  }) {
    _age = age;
    _email = email;
    _id = id;
    _name = name;
  }

  Students.fromJson(dynamic json) {
    _age = json['age'];
    _email = json['email'];
    _id = json['id'];
    _name = json['name'];
  }
  num? _age;
  String? _email;
  num? _id;
  String? _name;
  Students copyWith({
    num? age,
    String? email,
    num? id,
    String? name,
  }) =>
      Students(
        age: age ?? _age,
        email: email ?? _email,
        id: id ?? _id,
        name: name ?? _name,
      );
  num? get age => _age;
  String? get email => _email;
  num? get id => _id;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['age'] = _age;
    map['email'] = _email;
    map['id'] = _id;
    map['name'] = _name;
    return map;
  }
}
