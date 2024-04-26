import '/exports/exports.dart';

class TransferMoney extends StatefulWidget {
  const TransferMoney({super.key});

  @override
  State<TransferMoney> createState() => _TransferMoneyState();
}

class _TransferMoneyState extends State<TransferMoney> {
  double balance = 0;
  @override
  void initState() {
    super.initState();
    PaymentService().getWalletBalance().then((value) {
      setState(() {
        balance = value.walletBalance;
      });
    });
  }

  final amountController = TextEditingController();
  final accountNameController = TextEditingController();
  final accountController = TextEditingController();
  final branchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Transfer Money to"),
      ),
      body: Consumer<TextController>(builder: (context, controller, c) {
        return ListView(
          padding: const EdgeInsets.fromLTRB(15, 8, 15, 8.0),
          children: [
            const SpaceWidget(space: 0.05),
            Text(
              "${controller.text.get('name')}",
              style: Theme.of(context).textTheme.titleLarge!.apply(
                    fontWeightDelta: 15,
                    fontSizeDelta: 1.2,
                  ),
            ),
            CommonTextField(
              controller: amountController,
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
              hintText: "xxxxxxx",
              titleText: "Amount to transfer",
              radius: 15,
              icon: Icons.money,
              enableBorder: true,
              keyboardType: TextInputType.number,
              validate: (value) => value != null && value.isNotEmpty
                  ? null
                  : "Amount is required",
            ),
            if (controller.text.get('code') != 'MPS') ...[
              CommonTextField(
                controller: accountNameController,
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                hintText: "xxxxxxxx",
                titleText: "Account Name",
                radius: 15,
                icon: Icons.person,
                enableBorder: true,
                keyboardType: TextInputType.text,
                validate: (value) => value != null && value.isNotEmpty
                    ? null
                    : "Amount is required",
              ),
              CommonTextField(
                controller: accountController,
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                hintText: "xxxx xxxx xxxxx",
                titleText: "Account Number",
                radius: 15,
                icon: Icons.account_balance_wallet_sharp,
                enableBorder: true,
                keyboardType: TextInputType.number,
                validate: (value) => value != null && value.isNotEmpty
                    ? null
                    : "Amount is required",
              ),
              TapEffect(
                onClick: () {
                  showModalBottomSheet(
                    showDragHandle: true,
                    context: context,
                    builder: (context) {
                      return const BankBranches();
                    },
                  );
                },
                child: CommonTextField(
                  // controller: controller.text,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                  hintText: "select branch",
                  titleText: "Bank Branch",
                  radius: 15,
                  icon: Icons.account_tree_rounded,
                  enableBorder: true,
                  readOnly: true,
                  keyboardType: TextInputType.number,
                  validate: (value) => value != null && value.isNotEmpty
                      ? null
                      : "Amount is required",
                ),
              ),
            ],
            const SpaceWidget(space: 0.05),
            Center(
              child: Text(
                "Wallet Balance : UGX $balance",
                style: Theme.of(context).textTheme.titleMedium!.apply(
                      fontWeightDelta: 10,
                    ),
                textAlign: TextAlign.center,
              ),
            ),
            const SpaceWidget(space: 0.06),
            CustomButton(
              text: "Continue",
              buttonColor: Theme.of(context).primaryColor,
              textColor: Colors.white,
              onPress: () {
                if (amountController.text.isEmpty) {
                  showMessage(
                      message: "Enter an amount to proceed", type: 'warning');
                } else if (double.parse(amountController.text) > balance) {
                  showMessage(message: "Insufficient Balance", type: 'error');
                } else {
                  if (controller.text.get('code') == 'MPS') {
                    context
                        .read<TextController>()
                        .text
                        .put('amount', amountController.text);
                  } else {
                    context
                        .read<TextController>()
                        .text
                        .put('amount', amountController.text);
                    context
                        .read<TextController>()
                        .text
                        .put('account', accountController.text);
                    context
                        .read<TextController>()
                        .text
                        .put('branch', branchController.text);
                  }

                  Routes.routeTo(Routes.transferReview);
                }
              },
            ),
          ],
        );
      }),
    );
  }
}
