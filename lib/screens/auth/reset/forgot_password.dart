import "/exports/exports.dart";

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
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
              "A short code is going to be sent to your email to reset your password.",
              style: Theme.of(context).textTheme.bodyMedium!.apply(
                    fontSizeFactor: 1.2,
                  ),
            ),
            const SizedBox.square(
              dimension: 20,
            ),
            Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
                side: BorderSide(
                  color: Theme.of(context).primaryColor,
                  width: 1.75,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: ListTile(
                  title: Text(
                    "via Email",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  subtitle: Text(
                    "ex***@gmail.com",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  leading: CircleAvatar(
                    radius: 30,
                    child: Icon(
                      Icons.email,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ),
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
