import "/exports/exports.dart";
import "widgets/contact_detail.dart";

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  String _selected = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: Text(
          "Forgot Password",
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.w800,
                fontSize: 20,
              ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
        child: Column(
          children: [
            Image.asset("assets/pngs/forgot-password.png"),
            Text(
              "Select which contact detail we should use to reset your password.",
              style: Theme.of(context).textTheme.bodyMedium!.apply(
                    fontSizeFactor: 1.2,
                  ),
            ),
            const SizedBox.square(
              dimension: 20,
            ),
            ContactDetail(
              titleText: "via SMS",
              subText: "+256**********89",
              selected: _selected == "via SMS",
              icon: Icons.chat_bubble_outline_rounded,
              onPress: () => setState(() {
                _selected = "via SMS";
              }),
            ),
            ContactDetail(
              titleText: "via Email",
              selected: _selected == "via Email",
              subText: "ex...@mail.com",
              icon: Icons.mail,
              onPress: () => setState(() {
                _selected = "via Email";
              }),
            ),
            // button to handle next
            const SizedBox.square(
              dimension: 20,
            ),
            CustomButton(
              text: "Continue",
              buttonColor: Theme.of(context).primaryColor,
              textColor: Colors.white,
              onPress: () {
                Routes.routeTo(Routes.otp);
              },
            ),
          ],
        ),
      ),
    );
  }
}
