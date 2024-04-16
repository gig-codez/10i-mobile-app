// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:io';

import '../screens/auth/account/scan_back_side.dart';
import '../screens/auth/account/scan_selfie.dart';
import '/exports/exports.dart';

class AuthService {
  // function to handle login
  void login(Map<String, dynamic> data) async {
    var controller = Provider.of<LoaderController>(context, listen: false);
    try {
      // start the loader
      controller.isLoading = true;
// handle login route
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
        StorageService().setData('user', response.body);
        showMessage(message: "Account created successfully", type: 'success');
        // route to home screen
        Routes.replacePage(
          const VerifyEmailScreen(),
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

// function to change password
  void changePassword(Map<String, dynamic> data) async {
    var controller = context.read<LoaderController>();

    try {
      String? token = await SessionService().getToken();
      debugPrint(token);
      controller.isLoading = true;
      Response response = await client.post(
        Uri.parse(Apis.changePass),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Token $token',
        },
        body: json.encode(data),
      );
      if (response.statusCode == 200) {
        controller.isLoading = false;
// success message
        showAdaptiveDialog(
            context: context,
            builder: (context) {
              return const Dialog(
                backgroundColor: Colors.white,
                child: DialogWidget(),
              );
            });
      } else {
        controller.isLoading = false;
        var d = json.decode(response.body);
        showMessage(message: d['detail'], type: "error");
      }
    } on ClientException catch (_, e) {
      controller.isLoading = false;
      debugPrint("Error $e");
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

// function to recover email
  void requestRecoverEmail(Map<String, dynamic> data,
      {bool resend = false}) async {
    var controller = Provider.of<LoaderController>(context, listen: false);
    String? token = await SessionService().getToken();
    try {
      // start the loader
      controller.isLoading = true;
      Request request = Request("GET", Uri.parse(Apis.recoverEmail)
          // body: json.encode(data),
          );
      request.body = json.encode(data);
      request.headers.addAll({
        'Content-Type': 'application/json',
        'Authorization': 'Token $token',
      });
      var response = await client.send(request);
      if (response.statusCode == 200) {
        // remove loader
        controller.isLoading = false;
        showMessage(message: "OTP code sent to your phone", type: 'success');
        // route to login screen
        if (resend == false) {
          Routes.replacePage(
            const ResetPin(),
          );
        }
      } else {
        controller.isLoading = false;
        // error
        var d = json.decode(await response.stream.bytesToString());
        showMessage(message: d['otp'][0], type: 'error');
      }
    } on Exception catch (e, _) {
      debugPrint("Error: $e");
    }
  }

// function to recover phone
  void requestRecoverPhone(Map<String, dynamic> data,
      {bool resend = false}) async {
    var controller = Provider.of<LoaderController>(context, listen: false);
    String? token = await SessionService().getToken();
    try {
      // start the loader
      controller.isLoading = true;
      Request request = Request("GET", Uri.parse(Apis.recoverPhone)
          // body: json.encode(data),
          );
      request.body = json.encode(data);
      request.headers.addAll({
        'Content-Type': 'application/json',
        'Authorization': 'Token $token',
      });
      var response = await client.send(request);
      if (response.statusCode == 200) {
        // remove loader
        controller.isLoading = false;
        showMessage(message: "OTP code sent to your phone", type: 'success');
        // route to login screen
        if (resend == false) {
          Routes.replacePage(
            const ResetPin(),
          );
        }
      } else {
        controller.isLoading = false;
        // error
        var d = json.decode(await response.stream.bytesToString());
        showMessage(message: d['invalid_user'][0], type: 'error');
      }
    } on Exception catch (e, _) {
      debugPrint("Error: $e");
    }
  }

  // function to handle forgot password
  void recoverEmail(Map<String, dynamic> data) async {
    var controller = Provider.of<LoaderController>(context, listen: false);
    String? token = await SessionService().getToken();
    try {
      // start the loader
      controller.isLoading = true;
      Response response = await client.post(
        Uri.parse(Apis.recoverEmail),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Token $token',
        },
        body: json.encode(data),
      );
      if (response.statusCode == 200) {
        // remove loader
        controller.isLoading = false;
        showMessage(message: "OTP verified successfully", type: 'success');
        // route to otp screen
        Routes.replaceRouteTo(
          Routes.newPass,
        );
      } else {
        controller.isLoading = false;
        // error
        print(response.body);
        showMessage(message: "Invalid Details", type: 'error');
      }
    } on Exception catch (e, _) {
      debugPrint("Error: $e");
    }
  }

  // function to handle email verification.
  void recoverPhone(Map<String, dynamic> data) async {
    var controller = Provider.of<LoaderController>(context, listen: false);
    String? token = await SessionService().getToken();
    try {
      // start the loader
      controller.isLoading = true;
      Response response = await client.post(
        Uri.parse(Apis.recoverEmail),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Token $token',
        },
        body: json.encode(data),
      );
      if (response.statusCode == 200) {
        // remove loader
        controller.isLoading = false;
        showMessage(message: "OTP verified successfully", type: 'success');
        // route to otp screen
        Routes.replaceRouteTo(
          Routes.newPass,
        );
      } else {
        controller.isLoading = false;
        // error
        print(response.body);
        showMessage(message: "Invalid Details", type: 'error');
      }
    } on Exception catch (e, _) {
      debugPrint("Error: $e");
    }
  }

  // function to handle email verification
  void verifyEmail(Map<String, dynamic> data) async {
    var controller = Provider.of<LoaderController>(context, listen: false);
    String? token = await SessionService().getToken();
    try {
      // start the loader
      controller.isLoading = true;

      Response response = await client.post(
        Uri.parse(Apis.verifyEmail),
        headers: {
          'Authorization': 'Token $token',
          'Content-Type': 'application/json',
        },
        body: json.encode(data),
      );

      if (response.statusCode == 200) {
        // remove loader
        controller.isLoading = false;
        showMessage(message: "Email verified successfully", type: 'success');
        // print rsponse
        print(response.body);
        // route to login screen
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
        print("google => $googleUser");
        print("auth => $googleAuth");
        // save data to database
        Response response = await client.post(Uri.parse(Apis.googleAuth),
            headers: {
              'Content-Type': 'application/json',
            },
            body: json.encode({
              // "token": googleAuth.accessToken,
              "email": googleUser!.email,
              "google_id": googleUser.id,
              "server_auth_code": "${googleUser.serverAuthCode}",
              "photo_url": googleUser.photoUrl
            }));

        // if status is okay
        if (response.statusCode == 200) {
          // remove loader
          controller.isLoading = false;
          // store session id
          SessionService().storeToken(json.decode(response.body)['token']);
          // store user data
          StorageService().setData('user', (response.body));
          showMessage(
            message: "Authenticated by google successfully",
            type: 'success',
          );
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

// function to handle fetching reasons
  Future<ReasonsModel> getReasons() async {
    String? token = await SessionService().getToken();
    try {
      Response response = await client.get(
        Uri.parse(Apis.reasons),
        headers: {
          'Authorization': 'Token $token',
        },
      );
      if (response.statusCode == 200) {
        return reasonsModelFromJson(response.body);
      } else {
        showMessage(message: 'Failed to load reasons', type: 'error');
        throw Exception('Failed to load reasons');
      }
    } on Exception catch (e) {
      debugPrint("Error: $e");
      throw e;
    }
  }

// function to post user selected reasons to the database.

  Future<void> postReasons(List<int> reasons) async {
    String? token = await SessionService().getToken();
    try {
      Response response = await client.post(
        Uri.parse(Apis.reasons),
        headers: {
          'Authorization': 'Token $token',
          'Content-Type': 'application/json',
        },
        body: json.encode({'reasons': reasons}),
      );
      if (response.statusCode == 200) {
        showMessage(message: "Reasons saved successfully", type: 'success');
        // response.
        print(response.body);
        // redirect to indentity verification
        Routes.replacePage(
          const VerifyIdentity(),
        );
      } else {
        showMessage(message: "Failed to save reasons", type: 'error');
      }
    } on Exception catch (e) {
      debugPrint("Error: $e");
    }
  }

  // proof of residence
  void proofResidence() async {
    try {
      String verify = context.read<TextController>().text['value'];

      String? token = await SessionService().getToken();
      Response response = await client.post(Uri.parse(Apis.proofOfResidence),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Token $token',
          },
          body: json.encode({'verification_method': verify, 'country': 226}));
      if (response.statusCode == 200) {
        context.read<LoaderController>().isLoading = false;
        showMessage(message: "Reasons saved successfully", type: 'success');
        // response.
        print(response.body);
        // redirect to identity verification
        Routes.replacePage(
          const ScanDocument(),
        );
      } else {
        context.read<LoaderController>().isLoading = false;
        print(response.body);
        showMessage(message: "Failed to save reasons", type: 'error');
      }
    } on Exception catch (_, e) {
      context.read<LoaderController>().isLoading = false;
      debugPrint("Error: $e");
    }
  }

// fetch all countries
  Future<List<Map<String, dynamic>>> allCountries() async {
    try {
      //
      Response response = await client.get(Uri.parse(Apis.countries)
          // , headers: {
          //   'Authorization': 'Token $token',
          // }
          );
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        return Future.error("Failed to fetch all countries");
      }
    } on Exception catch (_, e) {
      debugPrint("Error $e");
      throw e;
    }
  }

  // function to upload front, back and with selfie images
  Future<void> uploadFront(Map<String, dynamic> data) async {
    String? token = await SessionService().getToken();
    try {
      var request = MultipartRequest("POST", Uri.parse(Apis.frontImage));
      request.files.add(
        MultipartFile(
          "image",
          data['imageData'],
          data['size'],
          filename: data['fileName'],
        ),
      );
      request.headers.addAll({"Authorization": "Token $token"});
      var response = await request.send();
      if (response.statusCode == 200) {
        showMessage(
            message: "Front side uploaded successfully", type: 'success');
        Routes.replacePage(
          const ScanBackSide(),
        );
        context.read<LoaderController>().isLoading = false;
      } else {
        showMessage(message: "Failed to upload front side", type: 'error');
        context.read<LoaderController>().isLoading = false;
      }
      // if(request.)
    } on Exception catch (_, e) {
      context.read<LoaderController>().isLoading = false;

      debugPrint("Error $e");
    }
  }

  Future<void> uploadBack(Map<String, dynamic> data) async {
    try {
      String? token = await SessionService().getToken();
      var request = MultipartRequest("POST", Uri.parse(Apis.backImage));
      request.files.add(
        MultipartFile(
          "image",
          data['imageData'],
          data['size'],
          filename: data['fileName'],
        ),
      );
      request.headers.addAll({"Authorization": "Token $token"});
      var response = await request.send();
      if (response.statusCode == 200) {
        context.read<LoaderController>().isLoading = false;

        showMessage(
            message: "Front side uploaded successfully", type: 'success');
        Routes.replacePage(
          const ScanSelfie(),
        );
      } else {
        context.read<LoaderController>().isLoading = false;

        showMessage(message: "Failed to upload back side", type: 'error');
      }
      // if(request.)
    } on Exception catch (_, e) {
      debugPrint("Error $e");
    }
  }

  Future<void> uploadSelfie(Map<String, dynamic> data) async {
    try {
      String? token = await SessionService().getToken();
      var request = MultipartRequest(
        "POST",
        Uri.parse(Apis.selfieImage),
      );
      request.files.add(
        MultipartFile(
          "image",
          data['imageData'],
          data['size'],
          filename: data['fileName'],
        ),
      );
      request.headers.addAll({"Authorization": "Token $token"});
      var response = await request.send();
      if (response.statusCode == 200) {
        showMessage(
            message: "Front side uploaded successfully", type: 'success');
        context.read<LoaderController>().isLoading = false;
        Routes.replaceRouteTo(Routes.completeProfile);
      } else {
        showMessage(message: "Failed to upload selfie", type: 'error');
        context.read<LoaderController>().isLoading = false;
      }
      // if(request.)
    } on Exception catch (_, e) {
      debugPrint("Error $e");
    }
  }

  // verify phone
  Future<void> verifyPhone() async {
    try {
      String? token = await SessionService().getToken();
      var response = await client.get(Uri.parse(Apis.verifyPhone), headers: {
        'Authorization': 'Token $token',
      });
      if (response.statusCode == 200) {
        context.read<LoaderController>().isLoading = false;
        showMessage(message: "Phone verification initiated.", type: 'success');
        Routes.replacePage(const VerifyPhone());
      }
    } on Exception catch (_, e) {
      debugPrint("Error $e");
    }
  }

// post phone otp
  Future<void> verifyTel(Map<String, dynamic> data) async {
    try {
      context.read<LoaderController>().isLoading = true;
      String? token = await SessionService().getToken();
      var response = await client.post(
        Uri.parse(Apis.verifyPhone),
        headers: {
          'Authorization': 'Token $token',
          'Content-Type': 'application/json',
        },
        body: json.encode(data),
      );
      if (response.statusCode == 200) {
        context.read<LoaderController>().isLoading = false;
        showMessage(message: "Phone verification successful.", type: 'success');
        Routes.replacePage(const CreatePin());
      } else {
        context.read<LoaderController>().isLoading = false;
        print(response.body);
        showMessage(message: "Invalid Details", type: 'error');
      }
    } on ClientException catch (_, e) {
      debugPrint("Error $e");
    }
  }

  Future<void> completeProfile(Map<String, dynamic> data) async {
    try {
      String? token = await SessionService().getToken();
      context.read<LoaderController>().isLoading = true;
      var response = await client.post(
        Uri.parse(Apis.completeProfile),
        headers: {
          'Authorization': 'Token $token',
          'Content-Type': 'application/json',
        },
        body: json.encode(data),
      );
      if (response.statusCode == 200) {
        // context.read<LoaderController>().isLoading = false;
        showMessage(
            message: "User Profile updated successfully", type: 'success');
        // trigger phone verification
        verifyPhone();
      } else {
        debugPrint(response.body);
        showMessage(message: "Invalid details", type: 'danger');
        context.read<LoaderController>().isLoading = false;
      }
    } on ClientException catch (_, e) {
      debugPrint("Error $e");
    }
  }

  // set wallet pin
  setWalletPin(Map<String, dynamic> data) async {
    try {
      String? token = await SessionService().getToken();
      context.read<LoaderController>().isLoading = true;
      var response = await client.post(
        Uri.parse(Apis.walletPin),
        headers: {
          'Authorization': 'Token $token',
          'Content-Type': 'application/json',
        },
        body: json.encode(data),
      );
      if (response.statusCode == 200) {
        context.read<LoaderController>().isLoading = false;
        showMessage(message: "Wallet pin set successfully", type: 'success');
        // trigger phone verification
        Routes.replacePage(const FingerPrintPage());
      } else {
        context.read<LoaderController>().isLoading = false;
        showMessage(message: "Failed to set wallet pin", type: 'error');
      }
    } on ClientException catch (_, e) {
      debugPrint("Error $e");
    }
  }

// function to upload user profile image
  void userProfile(Map<String, dynamic> data) async {
    try {
      context.read<LoaderController>().loading = true;
      String? token = await SessionService().getToken();
      var request = MultipartRequest("POST", Uri.parse(Apis.profilePic));
      request.files.add(
        MultipartFile(
          "image",
          data['imageData'],
          data['size'],
          filename: data['fileName'],
        ),
      );
      request.headers.addAll({"Authorization": "Token $token"});
      var response = await request.send();
      if (response.statusCode == 200) {
        showMessage(
            message: "Profile image uploaded successfully", type: 'success');
        context.read<LoaderController>().loading = false;
      } else {
        context.read<LoaderController>().loading = false;
        showMessage(message: "Failed to upload profile image", type: 'error');
      }
    } on ClientException catch (_, e) {
      context.read<LoaderController>().loading = false;
      debugPrint("Error $e");
    }
  }

  // capture face
  void captureFace(Map<String, dynamic> data) async {
    try {
      context.read<LoaderController>().loading = true;
      String? token = await SessionService().getToken();
      var request = MultipartRequest("POST", Uri.parse(Apis.captureFace));
      request.files.add(
        MultipartFile(
          "faces",
          data['imageData'],
          data['size'],
          filename: data['fileName'],
        ),
      );
      request.headers.addAll({"Authorization": "Token $token"});
      var response = await request.send();
      if (response.statusCode == 200) {
        showMessage(message: "Face captured successfully", type: 'success');
        context.read<LoaderController>().loading = false;
        Routes.replacePage(const LoginScreen());
      } else {
        context.read<LoaderController>().loading = false;
        debugPrint(response.reasonPhrase);
        showMessage(message: "Failed to upload profile image", type: 'error');
      }
    } on ClientException catch (_, e) {
      context.read<LoaderController>().loading = false;
      debugPrint("Error $e");
    }
  }
}
