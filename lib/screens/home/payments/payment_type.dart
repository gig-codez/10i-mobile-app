import "/exports/exports.dart";
import "widgets/payment_type_widget.dart";

class PaymentType extends StatefulWidget {
  const PaymentType({super.key});

  @override
  State<PaymentType> createState() => _PaymentTypeState();
}

class _PaymentTypeState extends State<PaymentType> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        leading: const BackButton(),
        title: Text(
          "Payment Type",
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.w800,
                fontSize: 20,
              ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
        child: Column(
          children: [
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "Choose Payment Type",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.w900,
                          fontSize: 24,
                        ),
                  ),
                  TextSpan(
                    text:
                        "\nWe want to provide the best experience according to the your needs.",
                    style: Theme.of(context).textTheme.bodyMedium!.apply(
                          fontSizeFactor: 1.2,
                        ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(3, 18, 3, 10),
              child: Divider(),
            ),
            const PaymentTypeWidget(
              icon: "services",
              title: "For goods and Services",
              subtitle:
                  "Get a full refund if an eligible item gets lost or damaged. Seller pays a small fee.",
            ),
            const PaymentTypeWidget(
              icon: "friends",
              color: Color.fromARGB(118, 182, 182, 182),
              title: "For friends and Family",
              subtitle: "Purchase protection doesn't apply for this payment.",
            ),
            CustomButton(
              text: "Continue",
              textColor: Colors.white,
              buttonColor: Theme.of(context).primaryColor,
              onPress: () => Routes.routeTo(Routes.review),
            ),
          ],
        ),
      ),
    );
  }
}
