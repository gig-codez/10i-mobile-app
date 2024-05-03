import 'dart:convert';

List<BillsModel> billsModelFromJson(String str) =>
    List<BillsModel>.from(json.decode(str).map((x) => BillsModel.fromJson(x)));

String billsModelToJson(List<BillsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BillsModel {
  final int id;
  final int owner;
  final int billType;
  final String amount;
  final String customerId;
  final bool splitBill;
  final bool fullyPaid;
  final bool depositPaid;
  final DateTime createdAt;
  final DateTime updatedAt;

  BillsModel({
    required this.id,
    required this.owner,
    required this.billType,
    required this.amount,
    required this.customerId,
    required this.splitBill,
    required this.fullyPaid,
    required this.depositPaid,
    required this.createdAt,
    required this.updatedAt,
  });

  factory BillsModel.fromJson(Map<String, dynamic> json) => BillsModel(
        id: json["id"],
        owner: json["owner"],
        billType: json["bill_type"],
        amount: json["amount"],
        customerId: json["customer_id"],
        splitBill: json["split_bill"],
        fullyPaid: json["fully_paid"],
        depositPaid: json["deposit_paid"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "owner": owner,
        "bill_type": billType,
        "amount": amount,
        "customer_id": customerId,
        "split_bill": splitBill,
        "fully_paid": fullyPaid,
        "deposit_paid": depositPaid,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
