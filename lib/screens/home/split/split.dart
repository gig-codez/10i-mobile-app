import "/exports/exports.dart";
import "bill_types.dart";

class Split extends StatefulWidget {
  const Split({super.key});

  @override
  State<Split> createState() => _SplitState();
}

class _SplitState extends State<Split> {
  String text = "Select bill type";
  final amountController = TextEditingController();
  int billType = 0;
  List<BillTypeModel> billTypes = [];
  @override
  Widget build(BuildContext context) {
    // fetch bill types
    BillService.getBillTypes().then((value) {
      billTypes = value;
    }).catchError((e) {
      showMessage(message: e);
    });
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Create a Bill",
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.w800,
                fontSize: 20,
              ),
        ),
      ),
      body: Consumer<LoaderController>(builder: (context, controller, c) {
        return ListView(
          padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
          children: [
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '\nHow much is the total bill?',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 19,
                        ),
                  ),
                  TextSpan(
                    text: '\nEnter the amount below?',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            const SpaceWidget(space: 0.07),
            SizedBox(
              height: 100,
              child: TextFormField(
                readOnly: controller.isLoading,
                style: Theme.of(context).textTheme.titleMedium!.apply(
                      fontWeightDelta: 5,
                    ),
                controller: amountController,
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: "Enter Amount",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            const SpaceWidget(space: 0.05),
            CustomSelectWidget(
              borderRadius: 20,
              textAlign: TextAlign.center,
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    showDragHandle: true,
                    builder: (context) {
                      return BottomSheet(
                          onClosing: () {},
                          builder: (context) {
                            return BillTypesPage(
                                billTypes: billTypes,
                                onSelect: (value) {
                                  setState(() {
                                    text = value.get('label');
                                    billType = value.get('value');
                                  });
                                });
                          });
                    });
              },
              displayText: text,
            ),
            const SpaceWidget(space: 0.05),
            CustomButton(
              onPress: controller.isLoading
                  ? () {}
                  : () {
                      if (amountController.text.isEmpty) {
                        showMessage(message: "Please enter the amount");
                        return;
                      } else {
                        BillService().createBill({
                          "amount": amountController.text,
                          "billType": billType,
                        });
                      }
                    },
              loading: controller.isLoading,
              text: "Create Bill",
              textColor: Colors.white,
              buttonColor: Theme.of(context).primaryColor,
            ),
          ],
        );
      }),
    );
  }
}
