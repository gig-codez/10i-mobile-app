import 'dart:convert';

WalletBalanceModel walletBalanceModelFromJson(String str) =>
    WalletBalanceModel.fromJson(json.decode(str));

String walletBalanceModelToJson(WalletBalanceModel data) =>
    json.encode(data.toJson());

class WalletBalanceModel {
  final int userId;
  final double moneyReceived;
  final double moneySpent;
  final double walletBalance;

  WalletBalanceModel({
    required this.userId,
    required this.moneyReceived,
    required this.moneySpent,
    required this.walletBalance,
  });

  factory WalletBalanceModel.fromJson(Map<String, dynamic> json) =>
      WalletBalanceModel(
        userId: json["user_id"],
        moneyReceived: json["money_received"].toDouble(),
        moneySpent: json["money_spent"].toDouble(),
        walletBalance: json["wallet_balance"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "money_received": moneyReceived,
        "money_spent": moneySpent,
        "wallet_balance": walletBalance,
      };
}
