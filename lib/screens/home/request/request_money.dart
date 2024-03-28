import "/exports/exports.dart";
import "confirm_prompt.dart";

class RequestMoney extends StatefulWidget {
  const RequestMoney({super.key});

  @override
  State<RequestMoney> createState() => _RequestMoneyState();
}

class _RequestMoneyState extends State<RequestMoney>
    with TickerProviderStateMixin {
  AnimationController? animationController;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 902),
    );
    // animationController!.repeat();
  }
  // dispose off animation controller after using it

  @override
  void dispose() {
    animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Request Money from John Doe"),
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
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontSize: 16,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(3, 18, 3, 10),
                child: Divider(color: Colors.grey.shade200),
              ),
              Center(
                child: Text(
                  "Enter amount to send\n",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontSize: 17,
                      ),
                ),
              ),
              const CommonTextField(
                hintText: "0.00",
                enableBorder: true,
                contentPadding: EdgeInsets.fromLTRB(5, 9, 5, 2),
                radius: 15,
              ),
              Text(
                "\n\t\tAdd a note (optional)\n",
                style: Theme.of(context).textTheme.bodyLarge!.apply(
                      fontWeightDelta: 5,
                    ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  maxLines: 4,
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
                onPress: () => showModalBottomSheet(
                  showDragHandle: true,
                  context: context,
                  builder: (context) {
                    return const ConfirmPrompt();
                  },
                  transitionAnimationController: animationController,
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
