import 'dart:convert';

List<PaymentTypesModel> paymentTypesModelFromJson(String str) => List<PaymentTypesModel>.from(json.decode(str).map((x) => PaymentTypesModel.fromJson(x)));

String paymentTypesModelToJson(List<PaymentTypesModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PaymentTypesModel {
    final int id;
    final String name;
    final String description;
    final DateTime createdAt;
    final DateTime updatedAt;

    PaymentTypesModel({
        required this.id,
        required this.name,
        required this.description,
        required this.createdAt,
        required this.updatedAt,
    });

    factory PaymentTypesModel.fromJson(Map<String, dynamic> json) => PaymentTypesModel(
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
