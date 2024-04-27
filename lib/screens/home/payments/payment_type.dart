import "/exports/exports.dart";
import "widgets/payment_type_widget.dart";

class PaymentType extends StatefulWidget {
  final String amount;
  final String note;
  final int receiver;
  final String email;
  const PaymentType(
      {super.key, this.email = "", this.amount = "0", required this.receiver, this.note = ""});

  @override
  State<PaymentType> createState() => _PaymentTypeState();
}

class _PaymentTypeState extends State<PaymentType> {
  int selected = -1;
  List<int> selecteds = [];
  Map<String, dynamic> selectedOption = {};
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
            const SpaceWidget(space: 0.052),
            Expanded(
              child: FutureBuilder(
                  future: PaymentService().paymentTypes(),
                  builder: (context, snapshot) {
                    var data = snapshot.data ?? [];
                    selecteds = List.generate(
                      data.length,
                      (i) => -1,
                    );
                    return snapshot.hasData
                        ? data.isEmpty
                            ? const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("No payment types recorded"),
                                ],
                              )
                            : ListView.builder(
                                itemCount: data.length,
                                itemBuilder: (context, index) {
                                  var type = data[index];
                                  return PaymentTypeWidget(
                                    value: selected,
                                    title: type.name,
                                    subtitle: type.description,
                                    selected: selected == index,
                                    onSelected: (x) {
                                      setState(() {
                                        selected = index;
                                        selectedOption = {
                                          "name": type.name,
                                          "amount": widget.amount,
                                          "receiver": widget.receiver,
                                          "note": widget.note,
                                          "email":widget.email,
                                          "description": type.description
                                        };
                                      });
                                    },
                                  );
                                },
                              )
                        : const Center(
                            child: CircularProgressIndicator(),
                          );
                  }),
            ),
            CustomButton(
              text: "Continue",
              textColor: Colors.white,
              buttonColor: Theme.of(context).primaryColor,
              onPress: () {
                context.read<TextController>().setText(selectedOption);
                Routes.routeTo(Routes.review);
              },
            ),
            const SpaceWidget(space: 0.2),
          ],
        ),
      ),
    );
  }
}
