// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  int id;
  Token token;
  String email;
  String name;
  String type;
  String username;
  bool isActive;
  bool isSuperuser;
  String mobile;
  DateTime createdAt;
  DateTime updatedAt;
  String about;
  bool isVerified;
  String image;

  User({
    required this.id,
    required this.token,
    required this.email,
    required this.name,
    required this.type,
    required this.username,
    required this.isActive,
    required this.isSuperuser,
    required this.mobile,
    required this.createdAt,
    required this.updatedAt,
    required this.about,
    required this.isVerified,
    required this.image,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    print(json);
    return User(
      id: json["id"],
      token: Token.fromJson(json["token"]),
      email: json["email"],
      name: json["name"],
      type: json["type"],
      username: json["username"],
      isActive: json["is_active"],
      isSuperuser: json["is_superuser"],
      mobile: json["mobile"],
      createdAt: DateTime.parse(json["created_at"]),
      updatedAt: DateTime.parse(json["updated_at"]),
      about: json["about"],
      isVerified: json["is_verified"],
      image: json["image"],
    );
  }
  Map<String, dynamic> toJson() => {
        "id": id,
        "token": token.toJson(),
        "email": email,
        "name": name,
        "type": type,
        "username": username,
        "is_active": isActive,
        "is_superuser": isSuperuser,
        "mobile": mobile,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "about": about,
        "is_verified": isVerified,
        "image": image,
      };
}

class Token {
  String refresh;
  String access;

  Token({
    required this.refresh,
    required this.access,
  });

  factory Token.fromJson(Map<String, dynamic> json) => Token(
        refresh: json["refresh"],
        access: json["access"],
      );

  Map<String, dynamic> toJson() => {
        "refresh": refresh,
        "access": access,
      };
}
