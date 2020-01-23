import 'dart:convert';

class User {
  String userIcon;
  String username;
  String disc;
  int userId;
  User.fromParams({
    this.userIcon,
    this.disc,
    this.username,
    this.userId,
  });

  factory User(jsonStr) => jsonStr == null
      ? null
      : jsonStr is String
          ? User.fromJson(json.decode(jsonStr))
          : User.fromJson(jsonStr);

  User.fromJson(jsonRes) {
    userId = jsonRes['id'];
    username = jsonRes['username'];
    userIcon = jsonRes['user_icon'];
    disc = jsonRes['disc'];
  }
}
