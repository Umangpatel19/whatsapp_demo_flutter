import 'package:watsup/class/Details.dart';

class UserResponse1 {
  List<Details> users;

  UserResponse1({this.users, List<Details> users1});

  UserResponse1.fromJson(Map<String, dynamic> json) {
    if (json['users'] != null) {
      users = new List<Details>();
      json['users'].forEach((v) {
        users.add(new Details.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.users != null) {
      data['users'] = this.users.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
