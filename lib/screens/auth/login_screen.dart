import 'package:flutter/gestures.dart';

import '/exports/exports.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // variables to handle showing and hiding the password
  bool passShowHide = false;

  // text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.only(left: 19.0, right: 19.0, top: 0),
        children: [
          Image.asset(
            "assets/pngs/login.png",
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width * 0.62,
          ),
          Text(
            "Login to Your Account.",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge!.apply(
                  fontSizeFactor: 1.2,
                  fontWeightDelta: 4,
                ),
          ),
          const SizedBox.square(
            dimension: 20,
          ),
          CommonTextField(
            hintText: "e.g example@gmail.com",
            enableBorder: true,
            icon: Icons.mail,
            titleText: "Email *",
            enableSuffix: false,
            contentPadding: const EdgeInsets.only(
              left: 16,
              right: 16,
              top: 16,
              bottom: 10,
            ),
            keyboardType: TextInputType.emailAddress,
            controller: emailController,
            validate: (value) {
              if (value!.isEmpty) {
                return "Please enter email";
              }
              return null;
            },
          ),
          const SizedBox.square(
            dimension: 20,
          ),
          CommonTextField(
            enableBorder: true,
            hintText: "******************",
            icon: Icons.lock,
            radius: 15,
            isObscureText: passShowHide,
            controller: passwordController,
            contentPadding: const EdgeInsets.only(
              left: 16,
              right: 16,
              top: 16,
              bottom: 10,
            ),
            enableSuffix: true,
            suffixIcon:
                passShowHide ? Icons.visibility_off : Icons.remove_red_eye,
            onTapSuffix: () {
              setState(() {});
            },
            titleText: "Password *",
            keyboardType: TextInputType.visiblePassword,
            onChanged: (value) {},
            validate: (value) {
              if (value!.isEmpty) {
                return "Please enter confirm password";
              }
              return null;
            },
          ),
          const SizedBox.square(
            dimension: 10,
          ),

          const SizedBox.square(
            dimension: 20,
          ),
          CustomButton(
            opacity: 1,
            textColor: Colors.white,
            text: "Sign In",
            onPress: () {
              // Routes.routeTo(Routes.homePage)
            },
          ),
          const SizedBox.square(
            dimension: 20,
          ),
          TextButton(
            onPressed: () => Routes.routeTo(Routes.forgotPass),
            child: Text(
              "Forgot Password?",
              style: Theme.of(context).textTheme.bodyLarge!.apply(
                    fontWeightDelta: 5,
                    color: Theme.of(context).primaryColor,
                  ),
            ),
          ),
          // const DividerWidget(
          //   text: "or continue with",
          // ),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "\nDon't have an account?",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.w100,
                      ),
                ),
                TextSpan(
                  text: " Sign Up",
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Routes.replacePage(const CreateAccount());
                    },
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
