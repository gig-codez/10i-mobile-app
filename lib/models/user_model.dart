import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  final User user;
  final String token;

  UserModel({
    required this.user,
    required this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        user: User.fromJson(json["user"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "token": token,
      };
}

class User {
  final int id;
  final String username;
  final bool isStaff;
  final bool isActive;
  final DateTime dateJoined;
  final DateTime dateOfBirth;
  final String address;
  final String gender;
  final String tel;
  final String firstName;
  final String lastName;
  final String email;
  final DateTime emailVerifiedTime;
  final bool telVerified;
  final String photoUrl;
  final String confirmationStatus;
  final dynamic confirmationStatusComment;
  final int country;
  final List<dynamic> groups;
  final List<dynamic> userPermissions;

  User({
    required this.id,
    required this.username,
    required this.isStaff,
    required this.isActive,
    required this.dateJoined,
    required this.dateOfBirth,
    required this.address,
    required this.gender,
    required this.tel,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.emailVerifiedTime,
    required this.telVerified,
    required this.photoUrl,
    required this.confirmationStatus,
    required this.confirmationStatusComment,
    required this.country,
    required this.groups,
    required this.userPermissions,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        username: json["username"],
        isStaff: json["is_staff"],
        isActive: json["is_active"],
        dateJoined: DateTime.parse(json["date_joined"]),
        dateOfBirth: DateTime.parse(json["date_of_birth"]),
        address: json["address"],
        gender: json["gender"],
        tel: json["tel"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        emailVerifiedTime: DateTime.parse(json["email_verified_time"]),
        telVerified: json["tel_verified"],
        photoUrl: json["photo_url"],
        confirmationStatus: json["confirmation_status"],
        confirmationStatusComment: json["confirmation_status_comment"],
        country: json["country"],
        groups: List<dynamic>.from(json["groups"].map((x) => x)),
        userPermissions:
            List<dynamic>.from(json["user_permissions"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "is_staff": isStaff,
        "is_active": isActive,
        "date_joined": dateJoined.toIso8601String(),
        "date_of_birth":
            "${dateOfBirth.year.toString().padLeft(4, '0')}-${dateOfBirth.month.toString().padLeft(2, '0')}-${dateOfBirth.day.toString().padLeft(2, '0')}",
        "address": address,
        "gender": gender,
        "tel": tel,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "email_verified_time": emailVerifiedTime.toIso8601String(),
        "tel_verified": telVerified,
        "photo_url": photoUrl,
        "confirmation_status": confirmationStatus,
        "confirmation_status_comment": confirmationStatusComment,
        "country": country,
        "groups": List<dynamic>.from(groups.map((x) => x)),
        "user_permissions": List<dynamic>.from(userPermissions.map((x) => x)),
      };
}
