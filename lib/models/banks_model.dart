import 'dart:convert';

BanksModel banksModelFromJson(String str) =>
    BanksModel.fromJson(json.decode(str));

String banksModelToJson(BanksModel data) => json.encode(data.toJson());

class BanksModel {
  String status;
  String message;
  List<Datum> data;

  BanksModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory BanksModel.fromJson(Map<String, dynamic> json) => BanksModel(
        status: json["status"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  int id;
  String code;
  String name;

  Datum({
    required this.id,
    required this.code,
    required this.name,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        code: json["code"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "code": code,
        "name": name,
      };
}
