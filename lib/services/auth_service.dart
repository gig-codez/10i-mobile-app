import 'dart:convert';
import '/exports/exports.dart';

class AuthService {
  // function to handle login
  void login(Map<String, dynamic> data) async {
    var controller = Provider.of<LoaderController>(context, listen: false);
    try {
      // start the loader
      controller.isLoading = true;

      Response response = await client.post(
        Uri.parse(Apis.login),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(data),
      );

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

// function to handle signing up
  void signUp(Map<String, dynamic> data) async {
    var controller = Provider.of<LoaderController>(context, listen: false);
    try {
      // start the loader
      controller.isLoading = true;

      Response response = await client.post(
        Uri.parse(Apis.signUp),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(data),
      );

      if (response.statusCode == 200) {
        // remove loader
        controller.isLoading = false;
        // store session id
        SessionService().storeToken(json.decode(response.body)['token']);
        // store user data
        StorageService().setData('user', json.decode(response.body));
        showMessage(message: "Account created successfully", type: 'success');
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

  // function to handle logout
  void logout() async {
    var controller = Provider.of<LoaderController>(context, listen: false);
    try {
      // start the loader
      controller.isLoading = true;

      Response response = await client.post(
        Uri.parse(Apis.logout),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${SessionService().getToken()}',
        },
      );

      if (response.statusCode == 200) {
        // remove loader
        controller.isLoading = false;
        // remove session id
        SessionService().clearToken();
        // remove user data
        StorageService().removeData('user');
        showMessage(message: "Logged out successfully", type: 'success');
        // route to login screen
        Routes.replacePage(
          const LoginScreen(),
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
