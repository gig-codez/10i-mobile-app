import "/exports/exports.dart";

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: Text(
          "About",
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 8, 15, 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: FlutterLogo(size: 200),
            ),
            Text(
              "\n Version : v1.0.0",
              style: Theme.of(context).textTheme.titleLarge!.apply(
                    fontWeightDelta: 25,
                    fontSizeDelta: 10,
                  ),
            ),
            Text(
              "Copyright © 2024 | All Rights Reserved",
              style: Theme.of(context).textTheme.bodyLarge!.apply(
                    fontWeightDelta: 1,
                  ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(3, 18, 3, 10),
              child: Divider(),
            ),
            ListTile(
              leading: const Icon(Icons.bug_report),
              trailing: const Icon(Icons.chevron_right),
              title: Text(
                "Report a bug",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .apply(fontSizeDelta: 1.5, fontWeightDelta: 4),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              trailing: const Icon(Icons.chevron_right),
              title: Text(
                "Exit App",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .apply(fontSizeDelta: 1.5, fontWeightDelta: 4),
              ),
              onTap: () => showExitPopup(context),
            )
          ],
        ),
      ),
    );
  }

  showExitPopup(BuildContext context) {
    showAdaptiveDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog.adaptive(
          title: const Text('Exit!'),
          content: const Text('Are you sure you want to exit the app?'),
          actions: <Widget>[
            TextButton(
              child: const Text('No'),
              onPressed: () {
                Routes.pop();
              },
            ),
            TextButton(
              child: const Text('Yes'),
              onPressed: () {
                SystemNavigator.pop();
              },
            ),
          ],
        );
      },
    );
  }
}
