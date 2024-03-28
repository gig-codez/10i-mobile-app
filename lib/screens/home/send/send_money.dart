import "/exports/exports.dart";

class SendMoney extends StatefulWidget {
  const SendMoney({super.key});

  @override
  State<SendMoney> createState() => _SendMoneyState();
}

class _SendMoneyState extends State<SendMoney> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: Text(
          "Send Money to",
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.w800,
                fontSize: 20,
              ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: const CircleAvatar(
                  backgroundImage: AssetImage(
                    "assets/pngs/dp.jpeg",
                  ),
                  radius: 40,
                ),
                title: Text(
                  "Jenny Wilson",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.w800,
                        fontSize: 18,
                      ),
                ),
                subtitle: Text(
                  "jennywilson255@gmail.com",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontSize: 16,
                      ),
                ),
              ),
              const Padding(
                padding: const EdgeInsets.fromLTRB(3, 18, 3, 10),
                child: Divider(),
              ),
              Center(
                child: Text(
                  "Enter amount to send\n",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontSize: 17,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    hintText: "0.00",
                    hintStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
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
              Text("\n\t\tAdd a note (optional)\n",
                  style: Theme.of(context).textTheme.bodyLarge!.apply(
                        fontWeightDelta: 5,
                      )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  maxLines: 10,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    hintText: "Add a note",
                    hintStyle: TextStyle(
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
                onPress: () => Routes.push(
                  const PaymentType(),
                ),
                buttonColor: Theme.of(context).primaryColor,
                textColor: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
