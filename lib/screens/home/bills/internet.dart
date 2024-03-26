import "/exports/exports.dart";
import "widgets/IconWrapper.dart";

class InternetPay extends StatefulWidget {
  const InternetPay({super.key});

  @override
  State<InternetPay> createState() => _InternetPayState();
}

class _InternetPayState extends State<InternetPay> {
  final internetBillController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Internet"),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(14, 5, 14, 5),
        children: [
          const IconWrapper(
            icon: 'wifi',
            color: Colors.deepOrange,
            keyText: "Internet",
          ),
          CommonTextField(
            titleText: "Enter Amount",
            hintText: "0.00",
            fieldColor: Colors.grey.shade100,
            controller: internetBillController,
            icon: Icons.attach_money_rounded,
            keyboardType: TextInputType.number,
            contentPadding: const EdgeInsets.fromLTRB(5, 7, 0, 5),
            readOnly: false,
          ),
          const SpaceWidget(),
          CustomButton(
            text: "Continue",
            buttonColor: Theme.of(context).primaryColor,
            textColor: Colors.white,
            onPress: () => Routes.pushPageWithRouteAndAnimation(
              const ConfirmPayment(
                title: "Internet",
                icon: "internet",
                color: Colors.deepOrange,
              ),
            ),
          ),
          const SpaceWidget(space: 0.25),
        ],
      ),
    );
  }
}
