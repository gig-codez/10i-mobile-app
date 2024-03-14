import "/exports/exports.dart";

class Security extends StatefulWidget {
  const Security({super.key});

  @override
  State<Security> createState() => _SecurityState();
}

class _SecurityState extends State<Security> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        elevation: 0,
        title: Text(
          "Security",
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.w800,
                fontSize: 20,
              ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 8, 10, 8.0),
        child: Column(
          children: [
            SwitchListTile.adaptive(
              value: true,
              onChanged: (x) {},
              title: const Text("Remember Me"),
            ),
            const SpaceWidget(),
            CustomButton(
              text: "Change Pin",
              onPress: () {
                Routes.push(
                  const NewPassword(),
                );
              },
            ),
            const SpaceWidget(space: 0.062),
            CustomButton(
              text: "Change Password",
              onPress: () {
                Routes.push(
                  const NewPassword(),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
