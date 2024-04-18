import "/exports/exports.dart";
import "dart:convert";

class PaymentService {
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

      // print("data => $data");

      if (response.statusCode == 200) {
        Routes.pop();
        showMessage(message: "Payment successful", type: "success");
        Routes.replacePage(
          const IndexPage(),
        );
        // print(response.body);
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
      StorageService storage = StorageService();
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
    } on ClientException catch (_, e) {
      debugPrint("Error $e");
      return Future.error("Connection error");
    }
  }

  // function to perform a transaction
  void executeTransaction(Map<String, dynamic> data) async {
    try {
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Basic YnJ1bm9sYWJzMjU2KzE4QGdtYWlsLmNvbTp0ZXN0MTIz'
      };
      var response = await client.post(
        Uri.parse(Apis.walletTransaction),
        headers: headers,
        body: json.encode(data),
      );

      if (response.statusCode == 200) {
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
        print(response.body);
        showDialogWindow(
          DialogWidget(
            title: "Payment Successful\n",
            subtitle: "\nYour payment has been processed successfully.",
            onPress: () => Routes.replacePage(
              const IndexPage(),
            ),
          ),);
        // showMessage(message: "Error in transaction.", type: "error");
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
}
