import 'package:wallet_app/screens/auth/account/face_capture.dart';

import "/exports/exports.dart";
// import 'package:local_auth/error_codes.dart' as auth_error;
import 'package:local_auth/local_auth.dart';

class FingerPrintPage extends StatefulWidget {
  const FingerPrintPage({super.key});

  @override
  State<FingerPrintPage> createState() => _FingerPrintPageState();
}

class _FingerPrintPageState extends State<FingerPrintPage> {
  final LocalAuthentication auth = LocalAuthentication();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: Text(
          " Fingerprint",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.w900,
                fontSize: 24,
              ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
        children: [
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text:
                      "\nAdd a fingerprint to make your account more secure.\n",
                  style: Theme.of(context).textTheme.bodyMedium!.apply(
                        fontSizeFactor: 1.2,
                      ),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),

          // image for verification
          SvgPicture.asset(
            "assets/svgs/finger_print.svg",
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width / 1.3,
            color: Theme.of(context).primaryColor,
          ),

          Text(
            "\nPut your finger on the fingerprint scanner to get started. ",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SpaceWidget(
            space: 0.05,
          ),
          Row(children: [
            Flexible(
              child: CustomButton(
                text: "Skip",
                onPress: () {
                  Routes.replacePage(const FacePage());
                },
              ),
            ),
            const SpaceWidget(space: 0.05),
            Flexible(
              child: CustomButton(
                text: "Continue",
                onPress: () async {
                  bool x = await FingerprintService().isBiometricAvailable();
                  if (x) {
                    await FingerprintService().authenticate();
                    Routes.replacePage(const FacePage());
                  } else {
                    showMessage(
                        message: "Biometrics not available on this device",
                        type: 'error');
                  }
                  // Routes.routeTo(Routes.verify);
                },
                buttonColor: Theme.of(context).primaryColor,
                textColor: Colors.white,
              ),
            )
          ])
        ],
      ),
    );
  }
}
