import "/exports/exports.dart";
import "widgets/contact_detail.dart";

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  String _selected = "";
  final textController = TextEditingController();
  showBottomPage() {
    showModalBottomSheet(
        context: context,
        showDragHandle: true,
        builder: (context) {
          return BottomSheet(
            onClosing: () {},
            builder: (context) {
              return Scaffold(
                backgroundColor: Colors.transparent,
                body: Consumer<LoaderController>(
                    builder: (context, controller, c) {
                  return ListView(
                    padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                    children: [
                      const SpaceWidget(space: 0.07),
                      Text(
                        "Provide your registered ${_selected == 'via Email' ? 'email address' : ' phone number'}",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SpaceWidget(space: 0.04),
                      CommonTextField(
                        icon: _selected == 'vai Email'
                            ? Icons.mail_outline
                            : Icons.phone,
                        enableBorder: true,
                        radius: 20,
                        titleText:
                            _selected == 'via Email' ? "Email" : "Phone number",
                        hintText: _selected == 'via Email'
                            ? "example@gmail.com"
                            : "07-xxx-xxx-xxx",
                        controller: textController,
                        readOnly: controller.isLoading,
                        keyboardType: _selected == 'via Email'
                            ? TextInputType.emailAddress
                            : TextInputType.phone,
                      ),
                      const SpaceWidget(space: 0.05),
                      CustomButton(
                        onPress: controller.isLoading
                            ? () {}
                            : () {
                                Provider.of<TextController>(context,
                                        listen: false)
                                    .setText(
                                        {"value": textController.text.trim(),"key":_selected});
                                if (_selected == 'via Email') {
                                  AuthService().requestRecoverEmail(
                                      {"email": textController.text.trim()});
                                } else {
                                  AuthService().requestRecoverPhone(
                                      {"tel": textController.text.trim()});
                                }
                                FocusScope.of(context).unfocus();
                              },
                        text: "Continue",
                        loading: controller.isLoading,
                        textColor: Colors.white,
                        buttonColor: Theme.of(context).primaryColor,
                      )
                    ],
                  );
                }),
              );
            },
          );
        });
  }

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
      body: Consumer<LoaderController>(builder: (context, controller, c) {
        return ListView(
          padding: const EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
          children: [
            AspectRatio(
              aspectRatio: 1.2,
              child: Image.asset(
                "assets/pngs/forgot-password.png",
              ),
            ),
            Text(
              "Select which contact detail we should use to reset your password.",
              style: Theme.of(context).textTheme.bodyMedium!.apply(
                    fontSizeFactor: 1.2,
                  ),
            ),
            const SizedBox.square(
              dimension: 10,
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
              loading: controller.isLoading,
              buttonColor: Theme.of(context).primaryColor,
              textColor: Colors.white,
              onPress: controller.isLoading ? () {} : () => showBottomPage(),
            ),
          ],
        );
      }),
    );
  }
}
