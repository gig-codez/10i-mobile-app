import "/exports/exports.dart";
// import "widgets/dialog_widget.dart";

class NewPassword extends StatefulWidget {
  const NewPassword({super.key});

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  bool passShowHide = false;
  bool cpassShowHide = false;
  //
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: Text(
          "New Password",
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.w800,
                fontSize: 20,
              ),
        ),
      ),
      body: Consumer<LoaderController>(builder: (context, controller, c) {
        return ListView(
          padding: const EdgeInsets.fromLTRB(13, 5, 13, 5),
          children: [
            Image.asset("assets/pngs/verified.png"),
            const SizedBox.square(
              dimension: 20,
            ),
            CommonTextField(
              enableBorder: true,
              hintText: "******************",
              icon: Icons.lock,
              isObscureText: !passShowHide,
              controller: passwordController,
              contentPadding: const EdgeInsets.only(
                left: 16,
                right: 16,
                top: 16,
                bottom: 10,
              ),
              enableSuffix: true,
              radius: 15,
              readOnly: controller.isLoading,
              suffixIcon:
                  passShowHide ? Icons.visibility_off : Icons.remove_red_eye,
              onTapSuffix: () {
                setState(() {
                  passShowHide = !passShowHide;
                });
              },
              titleText: "New Password *",
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
            CommonTextField(
              enableBorder: true,
              hintText: "******************",
              icon: Icons.lock,
              isObscureText: !cpassShowHide,
              radius: 15,
              readOnly: controller.isLoading,
              controller: confirmPasswordController,
              contentPadding: const EdgeInsets.only(
                left: 16,
                right: 16,
                top: 16,
                bottom: 10,
              ),
              enableSuffix: true,
              suffixIcon:
                  cpassShowHide ? Icons.visibility_off : Icons.remove_red_eye,
              onTapSuffix: () {
                setState(() {
                  cpassShowHide = !cpassShowHide;
                });
              },
              titleText: "Confirm Password *",
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
              dimension: 30,
            ),
            CustomButton(
              text: "Submit",
              loading: controller.isLoading,
              buttonColor: Theme.of(context).primaryColor,
              textColor: Colors.white,
              onPress: controller.isLoading
                  ? () {}
                  : () {
                      // Routes.routeTo("");
                      if (passwordController.text.trim().isEmpty ||
                          confirmPasswordController.text.trim().isEmpty) {
                        showMessage(message: "Please enter your password");
                      } else if (passwordController.text.trim() !=
                          confirmPasswordController.text.trim()) {
                        showMessage(message: "Password does not match");
                      } else {
                        AuthService().changePassword({
                          "password": passwordController.text.trim(),
                          "password_confirmation":
                              confirmPasswordController.text.trim(),
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
