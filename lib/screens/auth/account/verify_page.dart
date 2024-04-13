import "/exports/exports.dart";

class VerifyPage extends StatefulWidget {
  const VerifyPage({super.key});

  @override
  State<VerifyPage> createState() => _VerifyPageState();
}

class _VerifyPageState extends State<VerifyPage> {
  int nationalId = 0;
  int groupValue = 1;
  int passport = 0;
  int driversLicense = 0;
  int selectedOption = 0;
  // choose national_identity_card, passport or driver_license
  List<Map<String, dynamic>> options = [
    {"key": "Driving License", "value": "driving_license"},
    {"key": "Passport", "value": "passport"},
    {"key": "National ID", "value": "national_identity_card"},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(13, 8, 13, 8.0),
        child: Consumer<TextController>(builder: (context, controller, c) {
          return Consumer<LoaderController>(
              builder: (context, loader_controller, c) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "Proof Of Residency\n",
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
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
                  groupValue: groupValue,
                  value: nationalId,
                  onChanged: (value) {
                    setState(() {
                      nationalId = 1;
                      passport = 0;
                      driversLicense = 0;
                      selectedOption = 2;
                    });
                    controller.setText(options[selectedOption]);
                  },
                  icon: Icon(Icons.credit_card,
                      color: Theme.of(context).primaryColor),
                ),
                // space widget
                const SpaceWidget(),
                CustomRadioWidget(
                  label: "Passport",
                  groupValue: groupValue,
                  value: passport,
                  onChanged: (value) {
                    setState(() {
                      nationalId = 0;
                      passport = 1;
                      driversLicense = 0;
                      selectedOption = 1;
                    });
                    controller.setText(options[selectedOption]);
                  },
                  icon: SvgPicture.asset("assets/svgs/passport.svg",
                      color: Theme.of(context).primaryColor),
                ),
                // space widget
                const SpaceWidget(),
                CustomRadioWidget(
                  label: "Drivers License",
                  groupValue: groupValue,
                  value: driversLicense,
                  onChanged: (value) {
                    setState(() {
                      nationalId = 0;
                      passport = 0;
                      driversLicense = 1;
                      selectedOption = 0;
                    });
                    controller.setText(options[selectedOption]);
                  },
                  icon: Icon(Icons.credit_card,
                      color: Theme.of(context).primaryColor),
                ),
                CustomButton(
                  text: loader_controller.isLoading ? "processing..." : "Next",
                  loading: loader_controller.isLoading,
                  buttonColor: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  onPress: loader_controller.isLoading
                      ? () {}
                      : () {
                          loader_controller.isLoading = true;
                          AuthService().proofResidence();
                        },
                )
              ],
            );
          });
        }),
      ),
    );
  }
}
