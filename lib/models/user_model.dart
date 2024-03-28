import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  final String token;
  final User user;

  UserModel({
    required this.token,
    required this.user,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        token: json["token"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "user": user.toJson(),
      };
}

class User {
  final int id;
  final String username;
  final bool isActive;
  final DateTime dateJoined;
  final dynamic tel;
  final String firstName;
  final String lastName;
  final String email;
  final dynamic emailVerifiedTime;
  final bool telVerified;
  final dynamic photoUrl;
  final List<dynamic> groups;
  final List<dynamic> userPermissions;

  User({
    required this.id,
    required this.username,
    required this.isActive,
    required this.dateJoined,
    required this.tel,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.emailVerifiedTime,
    required this.telVerified,
    required this.photoUrl,
    required this.groups,
    required this.userPermissions,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        username: json["username"],
        isActive: json["is_active"],
        dateJoined: DateTime.parse(json["date_joined"]),
        tel: json["tel"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        emailVerifiedTime: json["email_verified_time"],
        telVerified: json["tel_verified"],
        photoUrl: json["photo_url"],
        groups: List<dynamic>.from(json["groups"].map((x) => x)),
        userPermissions:
            List<dynamic>.from(json["user_permissions"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "is_active": isActive,
        "date_joined": dateJoined.toIso8601String(),
        "tel": tel,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "email_verified_time": emailVerifiedTime,
        "tel_verified": telVerified,
        "photo_url": photoUrl,
        "groups": List<dynamic>.from(groups.map((x) => x)),
        "user_permissions": List<dynamic>.from(userPermissions.map((x) => x)),
      };
}
