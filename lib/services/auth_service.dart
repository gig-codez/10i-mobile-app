import 'dart:convert';
import '/exports/exports.dart';

class AuthService {
  // function to handle login
  void login() async {
    var controller = Provider.of<LoaderController>(context, listen: false);
    try {
      Response response = await client.get(Uri.parse(Apis.login));
      // start the loader
      controller.isLoading = true;
      if (response.statusCode == 200) {
        // remove loader
        controller.isLoading = false;
        // store session id
        SessionService().storeToken(json.decode(response.body)['token']);
        // store user data
        StorageService().setData('user', json.decode(response.body));
        showMessage(message: "Logged in successfully", type: 'success');
        // route to home screen
        Routes.replacePage(
          const IndexPage(),
        );
      } else {
        controller.isLoading = false;
        // error
        showMessage(message: "Invalid Details", type: 'error');
      }
    } on Exception catch (e, _) {
      debugPrint("Error: $e");
    }
  }
}
