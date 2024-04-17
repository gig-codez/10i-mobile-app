import "/exports/exports.dart";

class PaymentService {
  // function responsible to handle laoding money to the wallet.
  void loadWallet(Map<String, dynamic> data) async {
    SessionService session = SessionService();
     String? token = await session.getToken();
    try {
      var response = await client.get(
        Uri.parse(
          '${Apis.loadWallet}?txRef=${data.get('txRef')}&userId=${data.get('userId')}',
        ),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': "Bearer $token"
        },
      );

      print("data => $data");

      if (response.statusCode == 200) {
        print(response.body);
      } else {
        print("error ${response.reasonPhrase}");
      }
    } on ClientException catch (_, e) {
      debugPrint("Error $e");
    }
  }
}
