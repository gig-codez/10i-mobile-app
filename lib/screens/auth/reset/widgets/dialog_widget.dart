import "/exports/exports.dart";

class DialogWidget extends StatelessWidget {
  final VoidCallback? onPress;
  final String? title;
  final String? subtitle;
  const DialogWidget({super.key, this.onPress, this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.width,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Lottie.asset("assets/svgs/success.json", repeat: false, height: 200),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: title ?? "Password Reset\n",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.w900,
                        fontSize: 24,
                        color: Theme.of(context).primaryColor,
                      ),
                ),
                TextSpan(
                  text: subtitle ??
                      "\nYour password has been reset successfully.\n",
                  style: Theme.of(context).textTheme.bodyMedium!.apply(
                        fontSizeFactor: 1.2,
                      ),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox.square(
            dimension: 10,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(25.0, 0, 25.0, 8.0),
            child: CustomButton(
              width: double.infinity,
              buttonHeight: 50,
              onPress: onPress ?? () => Routes.replacePage(const LoginScreen()),
              text: "Okay",
            ),
          ),
        ],
      ),
    );
  }
}
