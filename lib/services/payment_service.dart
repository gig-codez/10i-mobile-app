import "/exports/exports.dart";
import "dart:convert";
import "../models/banks_model.dart";
import "../models/bank_branches_model.dart";

class PaymentService {
  StorageService storage = StorageService();

  // function responsible to handle laoding money to the wallet.
  void loadWallet(Map<String, dynamic> data) async {
    // SessionService session = SessionService();
    // String? token = await session.getToken();
    try {
      showLoader(text: "Verifying payment..");
      var response = await client.get(
        Uri.parse(
          '${Apis.loadWallet}?txRef=${data.get('txRef')}&userId=${data.get('userId')}',
        ),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Basic YnJ1bm9sYWJzMjU2KzE4QGdtYWlsLmNvbTp0ZXN0MTIz'
        },
      );
// 0773995421
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 204) {
        Routes.pop();
        showMessage(message: "Payment successful", type: "success");
        Routes.replacePage(
          const IndexPage(),
        );
      } else {
        showMessage(message: "error ${response.reasonPhrase}");
      }
    } on ClientException catch (_, e) {
      debugPrint("Error $e");
    }
  }

// function to create the wallet
  void createWallet() async {
    try {
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Basic YnJ1bm9sYWJzMjU2KzE4QGdtYWlsLmNvbTp0ZXN0MTIz'
      };
      var response = await client.post(
        Uri.parse(Apis.createWallet),
        headers: headers,
        body: json.encode({"user": ""}),
      );
      if (response.statusCode == 200) {
        showMessage(
            message: "user wallet created successfull", type: "success");
      } else {
        showMessage(
          message: json.decode(response.body)['message'],
          type: "success",
        );
      }
    } on ClientException catch (_, e) {
      debugPrint("Error $e");
    }
  }

// function to get wallets balance by user id
  Future<WalletBalanceModel> getWalletBalance() async {
    try {
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Basic YnJ1bm9sYWJzMjU2KzE4QGdtYWlsLmNvbTp0ZXN0MTIz'
      };
      var data = await storage.getData("user");
      var response = await client.get(
        Uri.parse("${Apis.getWallet}/${data['user']['id']}/"),
        headers: headers,
      );
      if (response.statusCode == 200) {
        return walletBalanceModelFromJson(response.body);
      } else {
        return Future.error("Failed to fetch wallet details");
      }
    } on Exception catch (_, e) {
      debugPrint("Error $e");
      throw Future.error("Connection error");
    }
  }

  // function to perform a transaction
  void executeTransaction(Map<String, dynamic> data) async {
    context.read<LoaderController>().isLoading = true;
    showLoader(text: "Payment in progress");
    try {
      var wallet = await getWalletDetails();
      data.put("wallet", wallet.id);
      data.put("sender", wallet.user);
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Basic YnJ1bm9sYWJzMjU2KzE4QGdtYWlsLmNvbTp0ZXN0MTIz'
      };
      var response = await Client().post(
        Uri.parse(Apis.walletTransaction),
        headers: headers,
        body: json.encode(data),
      );

      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 204) {
        Routes.pop();
        context.read<LoaderController>().isLoading = false;
        showDialogWindow(
          DialogWidget(
            title: "Payment Successful\n",
            subtitle: "\nYour payment has been processed successfully.",
            onPress: () => Routes.replacePage(
              const IndexPage(),
            ),
          ),
        );
        // showMessage(
        //     message: "Transaction executed successfully.", type: "success");
      } else {
        context.read<LoaderController>().isLoading = false;
        String msg = json.decode(response.body)['message'];
        showMessage(message: msg, type: "error");
      }
    } on ClientException catch (_, e) {
      debugPrint("Error $e");
    }
  }

  // function to fetch payment types
  Future<List<PaymentTypesModel>> paymentTypes() async {
    try {
      var headers = {
        'Authorization': 'Basic YnJ1bm9sYWJzMjU2KzE4QGdtYWlsLmNvbTp0ZXN0MTIz'
      };
      var response =
          await client.get(Uri.parse(Apis.paymentTypes), headers: headers);
      if (response.statusCode == 200) {
        return paymentTypesModelFromJson(response.body);
      } else {
        return Future.error(response.reasonPhrase as String);
      }
    } on ClientException catch (_, e) {
      debugPrint("Error $e");
      return Future.error("Server Connection error");
    }
  }

  // function to retrive all banks
  static Future<BanksModel> getAllBanks() async {
    try {
      var headers = {
        'Authorization': 'FLWSECK_TEST-e53b903e81b41413015d3984069ef4af-X'
      };
      var request = Request('GET', Uri.parse(Apis.ugBanks));
      request.headers.addAll(headers);
      StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        String x = await response.stream.bytesToString();
        return banksModelFromJson(x);
      } else {
        return Future.error(response.reasonPhrase ?? "Something went wrong");
      }
    } on Exception catch (_, e) {
      throw Exception("Error $e");
    }
  }

// function to fetch bank branches.
  static Future<BankBranchesModel> getBankBranches() async {
    try {
      var headers = {
        'Authorization': 'FLWSECK_TEST-e53b903e81b41413015d3984069ef4af-X'
      };
      var request = Request(
        'GET',
        Uri.parse(
            "${Apis.bankBranches}/${context.read<TextController>().text.get('id')}/branches"),
      );
      request.headers.addAll(headers);
      StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        return bankBranchesModelFromJson(await response.stream.bytesToString());
      } else {
        return Future.error(response.reasonPhrase ?? "Something went wrong.");
      }
    } on ClientException catch (_, e) {
      return Future.error('Error $e');
    }
  }

  Future<WalletModel> getWalletDetails() async {
    var user = await storage.getData("user");
    try {
      var headers = {
        'Authorization': 'Basic YnJ1bm9sYWJzMjU2KzE4QGdtYWlsLmNvbTp0ZXN0MTIz'
      };
      var request = Request(
        'GET',
        Uri.parse('${Apis.walletDetails}${user['user']['id']}/'),
      );
      request.headers.addAll(headers);
      StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        return walletModelFromJson(await response.stream.bytesToString());
      } else {
        return Future.error(response.reasonPhrase ?? "Something went wrong.");
      }
    } on ClientException catch (_, e) {
      return Future.error("Error $e");
    }
  }

  // function to withdraw money from wallet to a bank account
  /*
   * request.body = json.encode({
  "wallet": 1,
  "withdrawer": 1,
  "account_bank": "MTN",
  "bank_branch_code": "6383",
  "account_number": "743284042541328",
  "account_name": "Sweedle Gang",
  "amount": 500,
  "tax": 0,
  "currency": "UGX",
  "is_successful": true,
  "payment_type": 4,
  "transaction_type": 4,
  "transaction_category": 4,
  "transaction_response": "Success",
  "transaction_notes": "Payment for services",
  "system_notes": "Processed automatically"
});
   */

  Future<void> transferToBank() async {
    try {
      showLoader(text: "Transfer in process ..");
      var user = await storage.getData("user");
      var wallet = await getWalletDetails();
      var headers = {
        'Authorization': 'Basic YnJ1bm9sYWJzMjU2KzE4QGdtYWlsLmNvbTp0ZXN0MTIz'
      };
      var response = await client.post(
        Uri.parse(Apis.walletToBank),
        headers: headers,
        body: json.encode({
          "wallet": wallet.id,
          "withdrawer": user['user']['id'],
          "account_bank": context.read<TextController>().text.get('name'),
          "amount": context.read<TextController>().text.get('amount'),
          "bank_branch_code":
              context.read<TextController>().text.get('bank_branch_code'),
          "account_number":
              context.read<TextController>().text.get('account_number'),
          "account_name":
              context.read<TextController>().text.get('account_name'),
          "tax": 0,
          "currency": "UGX",
          "is_successful": true,
          "payment_type": 4,
          "transaction_type": 2,
          "transaction_category": 4,
          "transaction_response": "Success",
          "transaction_notes": "Payment for services",
          "system_notes": "Processed automatically"
        }),
      );
      if (response.statusCode == 200) {
        Routes.pop();
        showMessage(message: "Transfer successful", type: "success");
        Routes.replaceRouteTo(Routes.transferSuccess);
      } else {
        Routes.pop();
        return Future.error(response.reasonPhrase ?? "Something went wrong");
      }
    } on ClientException catch (_, e) {
      Routes.pop();
      throw Exception("Error $e");
    }
  }

  Future<void> transferToMM() async {
    showLoader(text: "Transfer in process ..");
    var ref = await storage.getData("transaction");
    var wallet = await getWalletDetails();
    var d = await storage.getData("user");
    try {
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Basic YnJ1bm9sYWJzMjU2KzE4QGdtYWlsLmNvbTp0ZXN0MTIz'
      };
      var request = Request('POST', Uri.parse(Apis.walletToMM));
      request.body = json.encode({
        "wallet": wallet.id,
        "withdrawer": wallet.user,
        "account_bank": context.read<TextController>().text.get('isp'),
        // "account_name": context.read<TextController>().text.get('isp'),
        "txt_ref": ref["txRef"],
        "amount": int.parse(context.read<TextController>().text.get('amount')),
        "tax": 0,
        "currency": "UGX",
        "is_successful": true,
        "payment_type": 4,
        "transaction_type": 2,
        "transaction_category": 3,
        "transaction_response": "Success",
        "transaction_notes": "Payment for services",
        "system_notes": "Processed automatically"
      });
      // print(request.body);
      request.headers.addAll(headers);
      StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        Routes.pop();
        debugPrint(await response.stream.bytesToString());
        showMessage(message: "Transfer successful", type: "success");
        Routes.replaceRouteTo(Routes.transferSuccess);
      } else {
        Routes.pop();
        String txt = await response.stream.bytesToString();
        print(txt);
        String msg = json.decode(txt)['message'];

        if (kDebugMode) {
          print(response.reasonPhrase);
        }
        showMessage(message: msg);
      }
    } on Exception catch (_, e) {
      Routes.pop();
      throw Exception("Error $e");
    }
  }
}
