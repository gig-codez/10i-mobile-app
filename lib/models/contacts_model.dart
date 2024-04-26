import 'dart:convert';

List<ContactsModel> contactsModelFromJson(String str) =>
    List<ContactsModel>.from(
        json.decode(str).map((x) => ContactsModel.fromJson(x)));

String contactsModelToJson(List<ContactsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ContactsModel {
  final int id;
  final String username;
  final String email;
  final String tel;
  final String firstName;
  final String lastName;

  ContactsModel({
    required this.id,
    required this.username,
    required this.email,
    required this.tel,
    required this.firstName,
    required this.lastName,
  });

  factory ContactsModel.fromJson(Map<String, dynamic> json) => ContactsModel(
        id: json["id"],
        username: json["username"] ?? "",
        email: json["email"] ?? "",
        tel: json["tel"] ?? "",
        firstName: json["first_name"] ?? "",
        lastName: json["last_name"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "tel": tel,
        "first_name": firstName,
        "last_name": lastName,
      };
}
