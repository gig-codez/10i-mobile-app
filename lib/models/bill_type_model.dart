import 'dart:convert';

List<BillTypeModel> billTypeModelFromJson(String str) =>
    List<BillTypeModel>.from(
        json.decode(str).map((x) => BillTypeModel.fromJson(x)));

String billTypeModelToJson(List<BillTypeModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BillTypeModel {
  final int id;
  final String name;
  final String description;
  final DateTime createdAt;
  final DateTime updatedAt;

  BillTypeModel({
    required this.id,
    required this.name,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
  });

  factory BillTypeModel.fromJson(Map<String, dynamic> json) => BillTypeModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
