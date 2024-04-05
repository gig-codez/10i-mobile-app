import 'dart:convert';
import 'dart:io';

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
        showMessage(
            message: json.decode(response.body)['auth'][0], type: 'error');
      }
    } on ClientException catch (e, _) {
      debugPrint("Error: $e");
    } on SocketException catch (e, _) {
      debugPrint("Network error!");
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
        print(response.body);
        // store session id
        SessionService().storeToken(json.decode(response.body)['token']);
        // store user data
        StorageService().setData('user', json.decode(response.body));
        showMessage(message: "Account created successfully", type: 'success');
        // route to home screen
        Routes.replacePage(
          const ReasonsPage(),
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
    String? token = await SessionService().getToken();
    try {
      // start the loader
      controller.isLoading = true;

      Response response = await client.post(
        Uri.parse(Apis.logout),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Token $token',
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

  // funcion to handle forgot password
  void forgotPassword(Map<String, dynamic> data) async {
    var controller = Provider.of<LoaderController>(context, listen: false);
    try {
      // start the loader
      controller.isLoading = true;

      Response response = await client.post(
        Uri.parse(Apis.forgotPassword),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(data),
      );

      if (response.statusCode == 200) {
        // remove loader
        controller.isLoading = false;
        showMessage(
            message: "Password reset link sent to your email", type: 'success');
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

  // function to handle response from signing in with google
  void handleGoogleAuth({required Widget child}) async {
    var controller = Provider.of<LoaderController>(context, listen: false);
    try {
      GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      // start the loader
      controller.isLoading = true;

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      if (googleAuth != null) {
        // remove loader
        // save data to database
        Response response = await client.post(Uri.parse(Apis.googleAuth),
            headers: {
              'Content-Type': 'application/json',
            },
            body: json.encode({
              // "token": googleAuth.accessToken,
              "email": googleUser!.email,
              "google_id": googleUser.id,
              "server_auth_code": googleUser.serverAuthCode,
              // "first_name": googleUser.displayName!.split(" ")[0],
              // "last_name": googleUser.displayName!.split(" ")[1],
              "photo_url": googleUser.photoUrl
            }));

        // if status is okay
        if (response.statusCode == 200) {
          // remove loader
          controller.isLoading = false;
          // store session id
          SessionService().storeToken(json.decode(response.body)['token']);
          // store user data
          StorageService().setData('user', json.decode(response.body));
          showMessage(
              message: "Authenticated by google successfully", type: 'success');
          // route to home screen
          Routes.replacePage(
            child,
          );
        }
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
