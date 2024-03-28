import "/exports/exports.dart";

class RequestSuccess extends StatefulWidget {
  const RequestSuccess({super.key});

  @override
  State<RequestSuccess> createState() => _RequestSuccessState();
}

class _RequestSuccessState extends State<RequestSuccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 5, 12, 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AspectRatio(
                aspectRatio: 1.5,
                child: SvgPicture.asset(
                  "assets/svgs/request_success.svg",
                ),
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "\nYou requested \$100 from John Doe.",
                      style: Theme.of(context).textTheme.titleLarge!.apply(
                            fontWeightDelta: 5,
                          ),
                    ),
                    //  Text('We will let Abigail Vaniasiwa know right away'),
                    // Text('that you requested money. You can see the'),
                    // Text('details in your activity in case you need them'),
                    // Text('later.'),
                    TextSpan(
                      text:
                          "\n\nWe will let Abigail Vaniasiwa know right away that you requested money. You can see the details in your activity in case you need them later.",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              const SpaceWidget(space: 0.12),
              Divider(
                color: Colors.grey.shade200,
              ),
              const SpaceWidget(space: 0.12),
              CustomButton(
                onPress: () => Routes.replacePage(
                  const IndexPage(),
                ),
                text: "Done",
                textColor: Colors.white,
                buttonColor: Theme.of(context).primaryColor,
              ),
              const SpaceWidget(space: 0.06),
              CustomButton(
                onPress: () {
                  Routes.pushPageWithRouteAndAnimation(
                    const IndexRequest(),
                  );
                },
                text: "New Request",
              )
            ],
          ),
        ),
      ),
    );
  }
}
