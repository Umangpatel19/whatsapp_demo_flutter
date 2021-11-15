import 'package:watsup/Form.dart/UserDetails.dart';

class UserResponse {
  List<UserDetails> users;

  UserResponse({this.users});

  UserResponse.fromJson(Map<String, dynamic> json) {
    if (json['users'] != null) {
      users = new List<UserDetails>();
      json['users'].forEach((v) {
        users.add(new UserDetails.fromJson(v));
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
