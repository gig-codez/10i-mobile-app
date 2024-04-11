import "/exports/exports.dart";

class VerifyIdentity extends StatefulWidget {
  const VerifyIdentity({super.key});

  @override
  State<VerifyIdentity> createState() => _VerifyIdentityState();
}

class _VerifyIdentityState extends State<VerifyIdentity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
        children: [
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "Let's Verify Your Identity\n",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.w900,
                        fontSize: 24,
                      ),
                ),
                TextSpan(
                  text:
                      "\nWe want to confirm your identity before you use our services.\n",
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
            "assets/svgs/verify_identity.svg",
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width,
          ),
          const SpaceWidget(
            space: 0.05,
          ),
          CustomButton(
            text: "Verify Identity",
            onPress: () {
              Routes.routeTo(Routes.verify);
            },
            buttonColor: Theme.of(context).primaryColor,
            textColor: Colors.white,
          )
        ],
      ),
    );
  }
}
