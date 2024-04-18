import 'dart:convert';

VerificationResponseModel verificationResponseModelFromJson(String str) =>
    VerificationResponseModel.fromJson(json.decode(str));

String verificationResponseModelToJson(VerificationResponseModel data) =>
    json.encode(data.toJson());

class VerificationResponseModel {
  final VerificationResponse verificationResponse;
  final String txRef;
  final String userWallet;
  final String depositTransactionType;
  final String mobileToWalletCategory;
  final String personalSavingsPaymentType;
  final int newTransactionId;

  VerificationResponseModel({
    required this.verificationResponse,
    required this.txRef,
    required this.userWallet,
    required this.depositTransactionType,
    required this.mobileToWalletCategory,
    required this.personalSavingsPaymentType,
    required this.newTransactionId,
  });

  factory VerificationResponseModel.fromJson(Map<String, dynamic> json) =>
      VerificationResponseModel(
        verificationResponse:
            VerificationResponse.fromJson(json["verification_response"]),
        txRef: json["txRef"],
        userWallet: json["user_wallet"],
        depositTransactionType: json["deposit_transaction_type"],
        mobileToWalletCategory: json["mobile_to_wallet_category"],
        personalSavingsPaymentType: json["personal_savings_payment_type"],
        newTransactionId: json["new_transaction_id"],
      );

  Map<String, dynamic> toJson() => {
        "verification_response": verificationResponse.toJson(),
        "txRef": txRef,
        "user_wallet": userWallet,
        "deposit_transaction_type": depositTransactionType,
        "mobile_to_wallet_category": mobileToWalletCategory,
        "personal_savings_payment_type": personalSavingsPaymentType,
        "new_transaction_id": newTransactionId,
      };
}

class VerificationResponse {
  final String status;
  final String message;
  final Data data;

  VerificationResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory VerificationResponse.fromJson(Map<String, dynamic> json) =>
      VerificationResponse(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  final int txid;
  final String txref;
  final String flwref;
  final String devicefingerprint;
  final String cycle;
  final int amount;
  final String currency;
  final int chargedamount;
  final int appfee;
  final int merchantfee;
  final int merchantbearsfee;
  final String chargecode;
  final String chargemessage;
  final String authmodel;
  final String ip;
  final String narration;
  final String status;
  final String vbvcode;
  final String vbvmessage;
  final String authurl;
  final String acctcode;
  final String acctmessage;
  final String paymenttype;
  final String paymentid;
  final String fraudstatus;
  final String chargetype;
  final int createdday;
  final String createddayname;
  final int createdweek;
  final int createdmonth;
  final String createdmonthname;
  final int createdquarter;
  final int createdyear;
  final bool createdyearisleap;
  final int createddayispublicholiday;
  final int createdhour;
  final int createdminute;
  final String createdpmam;
  final DateTime created;
  final int customerid;
  final String custphone;
  final String custnetworkprovider;
  final String custname;
  final String custemail;
  final String custemailprovider;
  final DateTime custcreated;
  final int accountid;
  final String acctbusinessname;
  final String acctcontactperson;
  final String acctcountry;
  final int acctbearsfeeattransactiontime;
  final int acctparent;
  final String acctvpcmerchant;
  final dynamic acctalias;
  final int acctisliveapproved;
  final String orderref;
  final dynamic paymentplan;
  final dynamic paymentpage;
  final dynamic raveref;
  final int amountsettledforthistransaction;
  final List<Meta> meta;

  Data({
    required this.txid,
    required this.txref,
    required this.flwref,
    required this.devicefingerprint,
    required this.cycle,
    required this.amount,
    required this.currency,
    required this.chargedamount,
    required this.appfee,
    required this.merchantfee,
    required this.merchantbearsfee,
    required this.chargecode,
    required this.chargemessage,
    required this.authmodel,
    required this.ip,
    required this.narration,
    required this.status,
    required this.vbvcode,
    required this.vbvmessage,
    required this.authurl,
    required this.acctcode,
    required this.acctmessage,
    required this.paymenttype,
    required this.paymentid,
    required this.fraudstatus,
    required this.chargetype,
    required this.createdday,
    required this.createddayname,
    required this.createdweek,
    required this.createdmonth,
    required this.createdmonthname,
    required this.createdquarter,
    required this.createdyear,
    required this.createdyearisleap,
    required this.createddayispublicholiday,
    required this.createdhour,
    required this.createdminute,
    required this.createdpmam,
    required this.created,
    required this.customerid,
    required this.custphone,
    required this.custnetworkprovider,
    required this.custname,
    required this.custemail,
    required this.custemailprovider,
    required this.custcreated,
    required this.accountid,
    required this.acctbusinessname,
    required this.acctcontactperson,
    required this.acctcountry,
    required this.acctbearsfeeattransactiontime,
    required this.acctparent,
    required this.acctvpcmerchant,
    required this.acctalias,
    required this.acctisliveapproved,
    required this.orderref,
    required this.paymentplan,
    required this.paymentpage,
    required this.raveref,
    required this.amountsettledforthistransaction,
    required this.meta,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        txid: json["txid"],
        txref: json["txref"],
        flwref: json["flwref"],
        devicefingerprint: json["devicefingerprint"],
        cycle: json["cycle"],
        amount: json["amount"],
        currency: json["currency"],
        chargedamount: json["chargedamount"],
        appfee: json["appfee"],
        merchantfee: json["merchantfee"],
        merchantbearsfee: json["merchantbearsfee"],
        chargecode: json["chargecode"],
        chargemessage: json["chargemessage"],
        authmodel: json["authmodel"],
        ip: json["ip"],
        narration: json["narration"],
        status: json["status"],
        vbvcode: json["vbvcode"],
        vbvmessage: json["vbvmessage"],
        authurl: json["authurl"],
        acctcode: json["acctcode"],
        acctmessage: json["acctmessage"],
        paymenttype: json["paymenttype"],
        paymentid: json["paymentid"],
        fraudstatus: json["fraudstatus"],
        chargetype: json["chargetype"],
        createdday: json["createdday"],
        createddayname: json["createddayname"],
        createdweek: json["createdweek"],
        createdmonth: json["createdmonth"],
        createdmonthname: json["createdmonthname"],
        createdquarter: json["createdquarter"],
        createdyear: json["createdyear"],
        createdyearisleap: json["createdyearisleap"],
        createddayispublicholiday: json["createddayispublicholiday"],
        createdhour: json["createdhour"],
        createdminute: json["createdminute"],
        createdpmam: json["createdpmam"],
        created: DateTime.parse(json["created"]),
        customerid: json["customerid"],
        custphone: json["custphone"],
        custnetworkprovider: json["custnetworkprovider"],
        custname: json["custname"],
        custemail: json["custemail"],
        custemailprovider: json["custemailprovider"],
        custcreated: DateTime.parse(json["custcreated"]),
        accountid: json["accountid"],
        acctbusinessname: json["acctbusinessname"],
        acctcontactperson: json["acctcontactperson"],
        acctcountry: json["acctcountry"],
        acctbearsfeeattransactiontime: json["acctbearsfeeattransactiontime"],
        acctparent: json["acctparent"],
        acctvpcmerchant: json["acctvpcmerchant"],
        acctalias: json["acctalias"],
        acctisliveapproved: json["acctisliveapproved"],
        orderref: json["orderref"],
        paymentplan: json["paymentplan"],
        paymentpage: json["paymentpage"],
        raveref: json["raveref"],
        amountsettledforthistransaction:
            json["amountsettledforthistransaction"],
        meta: List<Meta>.from(json["meta"].map((x) => Meta.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "txid": txid,
        "txref": txref,
        "flwref": flwref,
        "devicefingerprint": devicefingerprint,
        "cycle": cycle,
        "amount": amount,
        "currency": currency,
        "chargedamount": chargedamount,
        "appfee": appfee,
        "merchantfee": merchantfee,
        "merchantbearsfee": merchantbearsfee,
        "chargecode": chargecode,
        "chargemessage": chargemessage,
        "authmodel": authmodel,
        "ip": ip,
        "narration": narration,
        "status": status,
        "vbvcode": vbvcode,
        "vbvmessage": vbvmessage,
        "authurl": authurl,
        "acctcode": acctcode,
        "acctmessage": acctmessage,
        "paymenttype": paymenttype,
        "paymentid": paymentid,
        "fraudstatus": fraudstatus,
        "chargetype": chargetype,
        "createdday": createdday,
        "createddayname": createddayname,
        "createdweek": createdweek,
        "createdmonth": createdmonth,
        "createdmonthname": createdmonthname,
        "createdquarter": createdquarter,
        "createdyear": createdyear,
        "createdyearisleap": createdyearisleap,
        "createddayispublicholiday": createddayispublicholiday,
        "createdhour": createdhour,
        "createdminute": createdminute,
        "createdpmam": createdpmam,
        "created": created.toIso8601String(),
        "customerid": customerid,
        "custphone": custphone,
        "custnetworkprovider": custnetworkprovider,
        "custname": custname,
        "custemail": custemail,
        "custemailprovider": custemailprovider,
        "custcreated": custcreated.toIso8601String(),
        "accountid": accountid,
        "acctbusinessname": acctbusinessname,
        "acctcontactperson": acctcontactperson,
        "acctcountry": acctcountry,
        "acctbearsfeeattransactiontime": acctbearsfeeattransactiontime,
        "acctparent": acctparent,
        "acctvpcmerchant": acctvpcmerchant,
        "acctalias": acctalias,
        "acctisliveapproved": acctisliveapproved,
        "orderref": orderref,
        "paymentplan": paymentplan,
        "paymentpage": paymentpage,
        "raveref": raveref,
        "amountsettledforthistransaction": amountsettledforthistransaction,
        "meta": List<dynamic>.from(meta.map((x) => x.toJson())),
      };
}

class Meta {
  final int id;
  final String metaname;
  final String metavalue;
  final DateTime createdAt;
  final DateTime updatedAt;
  final dynamic deletedAt;
  final int getpaidTransactionId;

  Meta({
    required this.id,
    required this.metaname,
    required this.metavalue,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.getpaidTransactionId,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        id: json["id"],
        metaname: json["metaname"],
        metavalue: json["metavalue"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        deletedAt: json["deletedAt"],
        getpaidTransactionId: json["getpaidTransactionId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "metaname": metaname,
        "metavalue": metavalue,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "deletedAt": deletedAt,
        "getpaidTransactionId": getpaidTransactionId,
      };
}
