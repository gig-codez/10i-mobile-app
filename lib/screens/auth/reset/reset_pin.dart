import "package:flutter/gestures.dart";
import "dart:async";
import "/exports/exports.dart";

class ResetPin extends StatefulWidget {
  const ResetPin({super.key});

  @override
  State<ResetPin> createState() => _ResetPinState();
}

class _ResetPinState extends State<ResetPin> {
  final pinController = TextEditingController();
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

// function to implement timer logic for resending an otp
  int sec = 0;
  int min = 0;
  String time = "";
  void startTimer() {
    const duration = Duration(seconds: 60);
    Timer.periodic(duration, (timer) {
      setState(() {
        sec += 1;
        time = "$min : $sec";
      });

      if (sec >= 59) {
        timer.cancel();
        setState(() {
          min += 1;
          time = "$min : $sec";
          Future.delayed(const Duration(seconds: 1), () {
            setState(() {
              time = "";
            });
          });
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    const focusedBorderColor = Color.fromRGBO(23, 171, 144, 1);
    const fillColor = Color.fromRGBO(243, 246, 249, 0);
    const borderColor = Color.fromRGBO(23, 171, 144, 0.4);

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: borderColor),
      ),
    );
    var t_controller = context.read<TextController>();
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: Text(
          "Confirm OTP",
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.w800,
                fontSize: 20,
              ),
        ),
      ),
      body: Consumer<LoaderController>(builder: (context, controller, c) {
        return ListView(
          padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
          children: [
            AspectRatio(
                aspectRatio: 1.42, child: Image.asset("assets/pngs/otp.webp")),
            Center(
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "Code has been sent to\n",
                      style: Theme.of(context).textTheme.bodyMedium!.apply(
                            fontSizeFactor: 1.2,
                            color: Colors.grey.shade600,
                          ),
                    ),
                    TextSpan(
                      text: "${t_controller.text['value']}\n",
                      style: Theme.of(context).textTheme.titleSmall!.apply(
                            fontSizeFactor: 1.0,
                            fontWeightDelta: 1,
                            // color: Colors.grey.shade600,
                          ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
            // space widget
            // const SpaceWidget(space: 0.23),
            Directionality(
              // Specify direction if desired
              textDirection: TextDirection.ltr,
              child: Pinput(
                length: 6,
                controller: pinController,
                focusNode: focusNode,
                androidSmsAutofillMethod:
                    AndroidSmsAutofillMethod.smsUserConsentApi,
                listenForMultipleSmsOnAndroid: true,
                defaultPinTheme: defaultPinTheme,
                separatorBuilder: (index) => const SizedBox(width: 8),
                // validator: (value) {
                //   return value == '2222' ? null : 'Pin is incorrect';
                // },
                onClipboardFound: (value) {
                  debugPrint('onClipboardFound: $value');
                  pinController.setText(value);
                },
                hapticFeedbackType: HapticFeedbackType.lightImpact,
                onCompleted: (pin) {
                  debugPrint('onCompleted: $pin');
                },
                onChanged: (value) {
                  debugPrint('onChanged: $value');
                },
                cursor: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 9),
                      width: 22,
                      height: 1,
                      color: focusedBorderColor,
                    ),
                  ],
                ),
                focusedPinTheme: defaultPinTheme.copyWith(
                  decoration: defaultPinTheme.decoration!.copyWith(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: focusedBorderColor),
                  ),
                ),
                submittedPinTheme: defaultPinTheme.copyWith(
                  decoration: defaultPinTheme.decoration!.copyWith(
                    color: fillColor,
                    borderRadius: BorderRadius.circular(19),
                    border: Border.all(color: focusedBorderColor),
                  ),
                ),
                errorPinTheme: defaultPinTheme.copyBorderWith(
                  border: Border.all(color: Colors.redAccent),
                ),
              ),
            ),
            // space widget
            const SpaceWidget(space: 0.043),
            Text.rich(
              TextSpan(
                children: time.isNotEmpty
                    ? [
                        TextSpan(
                          text: time,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ]
                    : [
                        TextSpan(
                          text: "Didn't receive code? ",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        TextSpan(
                          text: "Resend",
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              startTimer();
                              if (t_controller.text['key'] == 'via Email') {
                                AuthService().requestRecoverEmail(
                                    {"email": t_controller.text['value']},
                                    resend: true);
                              } else {
                                AuthService().requestRecoverPhone(
                                    {"tel": t_controller.text['value']},
                                    resend: true);
                              }
                            },
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: Theme.of(context).primaryColor),
                        ),
                      ],
              ),
              textAlign: TextAlign.center,
            ),
            const SpaceWidget(space: 0.043),
            CustomButton(
              text: "Verify OTP",
              loading: controller.isLoading,
              buttonColor: Theme.of(context).primaryColor,
              textColor: Colors.white,
              onPress: () {
                if (t_controller.text['key'] == 'via Email') {
                  // Routes.routeTo(Routes.newPass);
                  AuthService().recoverEmail({
                    "otp_number": pinController.text.trim(),
                    "email": t_controller.text['value']
                  });
                } else {
                  AuthService().recoverPhone({
                    "otp_number": pinController.text.trim(),
                    "tel": t_controller.text['value']
                  });
                }
              },
            ),
          ],
        );
      }),
    );
  }
}
