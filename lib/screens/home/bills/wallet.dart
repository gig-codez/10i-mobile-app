import "/exports/exports.dart";

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});
  @override
  _WalletPageState createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  final formKey = GlobalKey<FormState>();
  final amountController = TextEditingController();
  final currencyController = TextEditingController();
  final narrationController = TextEditingController();
  final publicKeyController = TextEditingController();
  final encryptionKeyController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();

  String selectedCurrency = "";

  bool isTestMode = true;

  @override
  void initState() {
    super.initState();
    selectedCurrency = "UGX";
    getPhoneNumber();
  }

  void getPhoneNumber() {
    StorageService storage = StorageService();
    storage.getData('user').then((value) {
      // print(value);
      if (value is Map) {
        setState(() {
          phoneNumberController.text = value['user']['tel'];
          emailController.text = value['user']['email'];
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    currencyController.text = selectedCurrency;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Load Money to wallet"),
      ),
      body: Consumer<LoaderController>(
        builder: (context, controller, c) {
          return Form(
            key: formKey,
            child: ListView(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              children: <Widget>[
                CommonTextField(
                  controller: amountController,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                  hintText: "0.00",
                  titleText: "Amount",
                  radius: 15,
                  icon: Icons.money,
                  readOnly: controller.isLoading,
                  enableBorder: true,
                  keyboardType: TextInputType.number,
                  validate: (value) => value != null && value.isNotEmpty
                      ? null
                      : "Amount is required",
                ),
                InkWell(
                  onTap: _openBottomSheet,
                  child: CommonTextField(
                    controller: currencyController,
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                    readOnly: true,
                    enableBorder: true,
                    icon: Icons.currency_exchange,
                    radius: 15,
                    titleText: "Currency",
                    validate: (value) => value != null && value.isNotEmpty
                        ? null
                        : "Currency is required",
                  ),
                ),
                CommonTextField(
                  controller: phoneNumberController,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                  radius: 15,
                  readOnly: controller.isLoading,
                  hintText: "07xx-xxx-xxx",
                  icon: Icons.phone,
                  titleText: "Phone Number",
                  enableBorder: true,
                ),
                CustomButton(
                  width: double.infinity,
                  loading: controller.isLoading,
                  onPress: _onPressed,
                  text: "Make Payment",
                  textColor: Colors.white,
                  buttonColor: Theme.of(context).primaryColor,
                )
              ],
            ),
          );
        },
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  _onPressed() {
    final currentState = formKey.currentState;
    if (currentState != null && currentState.validate()) {
      Provider.of<LoaderController>(context, listen: false).isLoading = true;
      _handlePaymentInitialization();
    }
  }

  _handlePaymentInitialization() async {
    final Customer customer = Customer(email: emailController.text.trim());

    final Flutterwave flutterwave = Flutterwave(
      context: context,
      publicKey: publicKeyController.text.trim().isEmpty
          ? getPublicKey()
          : publicKeyController.text.trim(),
      currency: selectedCurrency,
      redirectUrl: 'https://facebook.com',
      txRef: const Uuid().v1(),
      amount: amountController.text.toString().trim(),
      customer: customer,
      paymentOptions: "card, payattitude, barter, bank transfer, ussd",
      customization: Customization(title: "10i Payment"),
      isTestMode: isTestMode,
    );
    final ChargeResponse response = await flutterwave.charge();
    if (response.status is String) {
      // save the transaction
      final transaction = {
        "amount": amountController.text.toString().trim(),
        "currency": selectedCurrency,
        "phone": phoneNumberController.text.trim(),
        "email": emailController.text.trim(),
        "txRef": response.txRef,
        "status": response.status,
        "transactionId": response.transactionId,
      };
      StorageService storage = StorageService();
      await storage.setData("transaction", transaction);
      Provider.of<LoaderController>(context, listen: false).isLoading = false;
     var d = await storage.getData("user");
      PaymentService().loadWallet({
         "txRef": response.txRef,
         "userId":d['user']['id']
      });
      showLoading(response.toString());
    } else {
      Provider.of<LoaderController>(context, listen: false).isLoading = false;
      showLoading("Transaction failed");
    }
    print("${response.toJson()}");
  }

  String getPublicKey() {
    return "FLWPUBK_TEST-a739c60601336ac5fad34ed37137a9cc-X";
  }

  void _openBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return _getCurrency();
        });
  }

  Widget _getCurrency() {
    final currencies = ["NGN", "RWF", "UGX", "KES", "ZAR", "USD", "GHS", "TZS"];
    return Container(
      height: 250,
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      color: Colors.white,
      child: ListView(
        children: currencies
            .map((currency) => ListTile(
                  onTap: () => {_handleCurrencyTap(currency)},
                  title: Column(
                    children: [
                      Text(
                        currency,
                        textAlign: TextAlign.start,
                        style: const TextStyle(color: Colors.black),
                      ),
                      const SizedBox(height: 4),
                      const Divider(height: 1)
                    ],
                  ),
                ))
            .toList(),
      ),
    );
  }

  _handleCurrencyTap(String currency) {
    setState(() {
      selectedCurrency = currency;
      currencyController.text = currency;
    });
   Routes.pop();
  }

  Future<void> showLoading(String message) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            margin: const EdgeInsets.fromLTRB(30, 20, 30, 20),
            width: double.infinity,
            height: 50,
            child: Text(message),
          ),
        );
      },
    );
  }
}
