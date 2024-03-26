import "/exports/exports.dart";
import "widgets/IconWrapper.dart";

class ConfirmPayment extends StatefulWidget {
  final String? title;
  final String? icon;
  final Color color;
  const ConfirmPayment({super.key, this.title, this.icon, required this.color});

  @override
  State<ConfirmPayment> createState() => _ConfirmPaymentState();
}

class _ConfirmPaymentState extends State<ConfirmPayment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.title}"),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(14, 5, 14, 5),
        children: [
          IconWrapper(
            icon: widget.icon ?? "",
            color: widget.color,
            keyText: widget.title ?? "",
          ),
          const PaymentSummary(),
          const SpaceWidget(),
          Center(
            child: CustomButton(
              onPress: () {
                showAdaptiveDialog(
                  context: context,
                  builder: (_) => Dialog(
                    child: DialogWidget(
                      title: "Payment",
                      subtitle: "\nPayment Successful",
                      onPress: () => Routes.replacePage(const IndexPage()),
                    ),
                  ),
                );
              },
              text: "Confrim & Pay",
            ),
          )
        ],
      ),
    );
  }
}
