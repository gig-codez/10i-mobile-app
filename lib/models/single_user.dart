import 'dart:convert';

SingleUserModel singleUserModelFromJson(String str) => SingleUserModel.fromJson(json.decode(str));

String singleUserModelToJson(SingleUserModel data) => json.encode(data.toJson());

class SingleUserModel {
    final int id;
    final String username;
    final String email;

    SingleUserModel({
        required this.id,
        required this.username,
        required this.email,
    });

    factory SingleUserModel.fromJson(Map<String, dynamic> json) => SingleUserModel(
        id: json["id"],
        username: json["username"],
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
    };
}
