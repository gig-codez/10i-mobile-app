import 'dart:convert';

ReasonsModel reasonsModelFromJson(String str) =>
    ReasonsModel.fromJson(json.decode(str));

String reasonsModelToJson(ReasonsModel data) => json.encode(data.toJson());

class ReasonsModel {
  final List<AllReason> allReasons;
  final List<dynamic> yourReasons;

  ReasonsModel({
    required this.allReasons,
    required this.yourReasons,
  });

  factory ReasonsModel.fromJson(Map<String, dynamic> json) => ReasonsModel(
        allReasons: List<AllReason>.from(
            json["all_reasons"].map((x) => AllReason.fromJson(x))),
        yourReasons: List<dynamic>.from(json["your_reasons"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "all_reasons": List<dynamic>.from(allReasons.map((x) => x.toJson())),
        "your_reasons": List<dynamic>.from(yourReasons.map((x) => x)),
      };
}

class AllReason {
  final int id;
  final String description;
  final bool isActive;

  AllReason({
    required this.id,
    required this.description,
    required this.isActive,
  });

  factory AllReason.fromJson(Map<String, dynamic> json) => AllReason(
        id: json["id"],
        description: json["description"],
        isActive: json["is_active"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "description": description,
        "is_active": isActive,
      };
}
