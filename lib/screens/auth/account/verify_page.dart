import "/exports/exports.dart";

class VerifyPage extends StatefulWidget {
  const VerifyPage({super.key});

  @override
  State<VerifyPage> createState() => _VerifyPageState();
}

class _VerifyPageState extends State<VerifyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(13, 8, 13, 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "Proof Of Residency\n",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.w900,
                            fontSize: 24,
                          ),
                    ),
                    TextSpan(
                      text: "\nProve you live in Uganda.\n",
                      style: Theme.of(context).textTheme.bodyMedium!.apply(
                            fontSizeFactor: 1.2,
                          ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),

            // space widget
            const SpaceWidget(),
            Text(
              "Choose Verification Method.",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 19,
                  ),
            ),
            // space widget
            const SpaceWidget(),
            CustomRadioWidget(
              label: "National ID",
              groupValue: 1,
              value: 0,
              onChanged: (value) {},
              icon: Icon(Icons.credit_card,
                  color: Theme.of(context).primaryColor),
            ),
            // space widget
            const SpaceWidget(),
            CustomRadioWidget(
              label: "Passport",
              groupValue: 1,
              value: 0,
              onChanged: (value) {},
              icon: SvgPicture.asset("assets/svgs/passport.svg",
                  color: Theme.of(context).primaryColor),
            ),
            // space widget
            const SpaceWidget(),
            CustomRadioWidget(
              label: "Drivers License",
              groupValue: 1,
              value: 0,
              onChanged: (value) {},
              icon: Icon(Icons.credit_card,
                  color: Theme.of(context).primaryColor),
            ),
            CustomButton(
              text: "Next",
              buttonColor: Theme.of(context).primaryColor,
              textColor: Colors.white,
              onPress: () {
                Routes.routeTo(Routes.completeProfile);
              },
            )
          ],
        ),
      ),
    );
  }
}
