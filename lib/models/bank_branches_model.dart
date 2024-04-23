import 'dart:convert';

BankBranchesModel bankBranchesModelFromJson(String str) =>
    BankBranchesModel.fromJson(json.decode(str));

String bankBranchesModelToJson(BankBranchesModel data) =>
    json.encode(data.toJson());

class BankBranchesModel {
  final String status;
  final String message;
  final List<Datum> data;

  BankBranchesModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory BankBranchesModel.fromJson(Map<String, dynamic> json) =>
      BankBranchesModel(
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
  final int id;
  final String branchCode;
  final String branchName;
  final dynamic swiftCode;
  final dynamic bic;
  final int bankId;

  Datum({
    required this.id,
    required this.branchCode,
    required this.branchName,
    required this.swiftCode,
    required this.bic,
    required this.bankId,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        branchCode: json["branch_code"],
        branchName: json["branch_name"],
        swiftCode: json["swift_code"],
        bic: json["bic"],
        bankId: json["bank_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "branch_code": branchCode,
        "branch_name": branchName,
        "swift_code": swiftCode,
        "bic": bic,
        "bank_id": bankId,
      };
}
