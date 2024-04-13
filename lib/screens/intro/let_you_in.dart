import "package:flutter/gestures.dart";

import "/exports/exports.dart";
import "widgets/social_widget.dart";
import "../../widgets/divider_widget.dart";

class LetYouIn extends StatefulWidget {
  const LetYouIn({super.key});

  @override
  State<LetYouIn> createState() => _LetYouInState();
}

class _LetYouInState extends State<LetYouIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
          children: [
            const SpaceWidget(space: 0.27),
            Center(
              child: AspectRatio(
                aspectRatio: 2,
                child: SvgPicture.asset(
                  "assets/svgs/welcome.svg",
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width,
                ),
              ),
            ),
            const SpaceWidget(space: 0.07),
            Center(
              child: Text(
                "Let's get you in\n",
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      fontWeight: FontWeight.w900,
                    ),
              ),
            ),
            SocialWidget(
              image: "assets/svgs/google.svg",
              text: "Continue with Google",
              onTap: () => AuthService().handleGoogleAuth(
                child: const ReasonsPage(),
              ),
            ),
            const SpaceWidget(space: 0.053),
            const DividerWidget(),
            const SpaceWidget(space: 0.053),
            CustomButton(
              onPress: () => Routes.replacePage(const LoginScreen()),
              text: "Sign in with password",
              textColor: Colors.white,
              buttonColor: Theme.of(context).primaryColor,
            ),
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
            )
          ],
        ),
      ),
    );
  }
}
