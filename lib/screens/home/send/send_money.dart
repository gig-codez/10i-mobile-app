import "/exports/exports.dart";

class SendMoney extends StatefulWidget {
  final int receiverId;
  final String? email;
  const SendMoney({super.key, this.receiverId = 0, this.email});

  @override
  State<SendMoney> createState() => _SendMoneyState();
}

class _SendMoneyState extends State<SendMoney> {
  // text controllers
  final amountController = TextEditingController();
  final noteController = TextEditingController();
  // amount
  double amount = 0.0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // var p = getScannedUser().user;
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        forceMaterialTransparency: true,
        title: Text(
          "Send Money to",
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.w800,
                fontSize: 20,
              ),
        ),
      ),
      body: Consumer<DataController>(builder: (context, data, ct) {
        return Consumer<LoaderController>(
          builder: (context, controller, c) => ListView(
            padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
            children: [
              ListTile(
                leading: const CircleAvatar(
                  backgroundImage: AssetImage(
                    "assets/pngs/default.jpeg",
                  ),
                  radius: 40,
                ),
                // title: Text(
                //   "${p.firstName} ${p.lastName}",
                //   style: Theme.of(context).textTheme.titleMedium!.copyWith(
                //         fontWeight: FontWeight.w800,
                //         fontSize: 19,
                //       ),
                // ),
                subtitle: Text(
                  widget.email ?? "",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontSize: 15,
                      ),
                ),
              ),
              // Chip(
              //   label: Text(
              //     "Send Money",
              //     style: Theme.of(context).textTheme.bodyLarge!.apply(
              //           fontWeightDelta: 1,
              //           fontSizeDelta: 2,
              //         ),
              //   ),
              //   backgroundColor: Theme.of(context).primaryColor,
              // ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 8, 10, 8),
                child: Text(
                  "\n\nAccount balance : ${data.balance}",
                  style: Theme.of(context).textTheme.bodyLarge!.apply(
                        fontWeightDelta: 5,
                        fontSizeDelta: 2,
                      ),
                ),
              ),
              const SpaceWidget(),
              CommonTextField(
                hintText: "0.00",
                enableBorder: true,
                readOnly: controller.isLoading,
                titleText: "Amount",
                controller: amountController,
                icon: Icons.attach_money_rounded,
                contentPadding: const EdgeInsets.fromLTRB(5, 9, 5, 2),
                radius: 15,
              ),
              Text("\n\t\tAdd a note (optional)",
                  style: Theme.of(context).textTheme.bodyLarge!.apply(
                        fontWeightDelta: 5,
                      )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  maxLines: 2,
                  controller: noteController,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    hintText: "Add a note",
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: Colors.grey.shade300,
                      ),
                    ),
                  ),
                ),
              ),
              // space widget
              const SpaceWidget(),
              CustomButton(
                text: "Continue",
                loading: controller.isLoading,
                onPress: () {
                  if (double.parse(amountController.text) > data.balance) {
                    showMessage(
                      message: "You don't have enough balance",
                      type: 'warning',
                    );
                  } else {
                    Routes.push(
                      PaymentType(
                        receiver: widget.receiverId,
                        amount: amountController.text,
                        note: noteController.text,
                        email: widget.email ?? "",
                      ),
                    );
                  }
                },
                buttonColor: Theme.of(context).primaryColor,
                textColor: Colors.white,
              )
            ],
          ),
        );
      }),
    );
  }
}
