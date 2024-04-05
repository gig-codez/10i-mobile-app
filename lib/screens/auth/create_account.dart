import 'package:flutter/gestures.dart';

import '../intro/widgets/social_widget.dart';
import '/exports/exports.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  // text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  // form key
  final formKey = GlobalKey<FormState>();
  // variables to handle showing and hiding the password
  bool passShowHide = false;
  bool confirmPassShowHide = false;
  @override
  Widget build(BuildContext context) {
    SessionService().getToken().then((value) {
      if (value != null) {
        // Navigator.pushReplacementNamed(context, "/home");
        print("token $value");
      }
    });
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 19.0, right: 19.0, top: 12.0),
        child: Form(
          key: formKey,
          child:
              Consumer<LoaderController>(builder: (context, controller, child) {
            return ListView(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox.square(
                  dimension: 20,
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "Create an Account\n ",
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontWeight: FontWeight.w900,
                              fontSize: 30,
                            ),
                      ),
                      TextSpan(
                        text:
                            "\nEnter email and password. if you forget, then you will have to do forgot password.",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              fontWeight: FontWeight.w300,
                              fontSize: 16,
                              color: Colors.black,
                            ),
                      ),
                    ],
                  ),
                ),
                const SizedBox.square(
                  dimension: 20,
                ),
                CommonTextField(
                  hintText: "example@gmail.com",
                  enableBorder: true,
                  icon: Icons.mail,
                  readOnly: controller.isLoading,
                  titleText: "Email",
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  radius: 15,
                  contentPadding: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                    top: 16,
                    bottom: 10,
                  ),
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
                  hintText: "******************",
                  enableBorder: true,
                  icon: Icons.lock,
                  titleText: "Password",
                  readOnly: controller.isLoading,
                  isObscureText: !passShowHide,
                  enableSuffix: true,
                  contentPadding: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                    top: 16,
                    bottom: 10,
                  ),
                  radius: 15,
                  suffixIcon: !passShowHide
                      ? Icons.visibility_off
                      : Icons.remove_red_eye,
                  keyboardType: TextInputType.visiblePassword,
                  controller: passwordController,
                  validate: (value) {
                    if (value!.isEmpty) {
                      return "Please enter password";
                    }
                    return null;
                  },
                  onTapSuffix: () {
                    setState(() {
                      passShowHide = !passShowHide;
                    });
                  },
                ),
                const SizedBox.square(
                  dimension: 20,
                ),
                CommonTextField(
                  enableBorder: true,
                  hintText: "******************",
                  radius: 15,
                  icon: Icons.lock,
                  isObscureText: !confirmPassShowHide,
                  readOnly: controller.isLoading,
                  controller: confirmPasswordController,
                  contentPadding: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                    top: 16,
                    bottom: 10,
                  ),
                  enableSuffix: true,
                  suffixIcon: !confirmPassShowHide
                      ? Icons.visibility_off
                      : Icons.remove_red_eye,
                  onTapSuffix: () {
                    setState(() {
                      confirmPassShowHide = !confirmPassShowHide;
                    });
                  },
                  titleText: "Confirm Password",
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
                  dimension: 20,
                ),
                CustomButton(
                  text: "Continue",
                  textColor: Colors.white,
                  opacity: 1,
                  loading: controller.isLoading,
                  onPress: controller.isLoading
                      ? () {}
                      : () {
                          if (!formKey.currentState!.validate()) {
                            showMessage(
                                message: "Please fill all required fields");
                          } else {
                            if (passwordController.text !=
                                confirmPasswordController.text) {
                              showMessage(message: "Passwords do not match");
                            } else {
                              AuthService().signUp(
                                {
                                  "email": emailController.text,
                                  "password": passwordController.text,
                                  "password_confirmation":
                                      confirmPasswordController.text,
                                },
                              );
                            }
                          }
                          // Routes.routeTo(Routes.reasons);
                        },
                ),
                const SpaceWidget(),
                const DividerWidget(
                  text: "or continue with",
                ),
                const SpaceWidget(),
                const SocialWidget(
                  image: "assets/svgs/google.svg",
                  text: "Continue with Google",
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "\nAlready have an account?",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.w100,
                            ),
                      ),
                      TextSpan(
                        text: "  Sign In",
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Routes.replacePage(
                              const LoginScreen(),
                            );
                          },
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor,
                            ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                )
              ],
            );
          }),
        ),
      ),
    );
  }
}
