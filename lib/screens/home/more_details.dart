// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:async';

import 'package:teni_app/screens/home/widgets/theme_widget.dart';

import '/exports/exports.dart';

class MoreDetails extends StatefulWidget {
  const MoreDetails({super.key});

  @override
  State<MoreDetails> createState() => _MoreDetailsState();
}

class _MoreDetailsState extends State<MoreDetails> {
  StorageService storage = StorageService();
  var user;
  @override
  Widget build(BuildContext context) {
    storage.getData("user").then((value) {
      if (value is Map<String, dynamic>) {
        var x = value.get('user');
        print(x);
        user = (x);
      }
      // user = value['user'];
    });
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SpaceWidget(
              space: 0.092,
            ),
            ProfileWidget(
              titleText: user == null
                  ? ""
                  : "${user['first_name']} ${user['last_name']}",
              size: 30,
              subText: user == null ? " " : "${user['email']}",
              color: Theme.of(context).primaryColor,
              // icon: Icons.edit,
              img: "assets/pngs/default.jpeg",
              tile: true,
              onPress: () {
                Routes.pushPageWithRouteAndAnimation(const PersonalInfo(),
                    type: 'slide');
              },
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Divider(
                color: Colors.grey.shade300,
              ),
            ),
            ProfileWidget(
              titleText: "App Theme",
              prefixIcon: "profile.svg",
              color: Colors.deepOrangeAccent,
              size: 20,
              onPress: () {
                // modal bottom sheet
                showModalBottomSheet(
                  showDragHandle: true,
                  context: context,
                  builder: (BuildContext context) {
                    return const ThemeWidget();
                  },
                );
              },
              iconSize: 20,
            ),
            ProfileWidget(
              titleText: "About",
              color: Theme.of(context).primaryColor,
              prefixIcon: "about.svg",
              onPress: () {
                Routes.pushPageWithRouteAndAnimation(const AboutPage(),
                    type: 'slide');
              },
              size: 20,
              iconSize: 20,
            ),
            ProfileWidget(
              titleText: "Security",
              color: Colors.teal,
              prefixIcon: "security.svg",
              onPress: () {
                Routes.pushPageWithRouteAndAnimation(const Security(),
                    type: 'slide');
              },
              size: 20,
              iconSize: 20,
            ),
            ProfileWidget(
              titleText: "Notifications",
              prefixIcon: "notification.svg",
              color: Colors.deepPurple,
              size: 20,
              iconSize: 20,
              onPress: () {
                Routes.pushPageWithRouteAndAnimation(const Notifications(),
                    type: 'slide');
              },
            ),
            ProfileWidget(
              titleText: "Data & Privacy",
              color: Colors.blue,
              prefixIcon: "privacy.svg",
              size: 20,
              iconSize: 20,
              onPress: () {
                Routes.pushPageWithRouteAndAnimation(const Privacy(),
                    type: 'slide');
              },
            ),
            ProfileWidget(
              titleText: "Help",
              prefixIcon: "help.svg",
              color: Colors.green,
              onPress: () {
                Routes.pushPageWithRouteAndAnimation(const HelpCenter(),
                    type: 'slide');
              },
              size: 20,
              iconSize: 20,
            ),
            ProfileWidget(
              titleText: "Close Account",
              prefixIcon: "close_account.svg",
              onPress: () {
                showLoader(text: "Closing account....");
                // showAdaptiveDialog(
                //     context: context,
                //     builder: (BuildContext context) {
                //       return AlertDialog.adaptive(
                //         icon: const Icon(
                //           Icons.warning,
                //           size: 50,
                //         ),
                //         content: const Text(
                //           "Are you sure you want close your account?",
                //           textAlign: TextAlign.center,
                //         ),
                //         actions: [
                //           TextButton(
                //             onPressed: () {
                //               Routes.pop();
                //               Routes.replaceRouteTo(Routes.login);
                //             },
                //             child: const Text(
                //               "Close Account",
                //               style: TextStyle(
                //                 color: Colors.red,
                //               ),
                //             ),
                //           ),
                //           TextButton(
                //             onPressed: () => Routes.pop(),
                //             child: const Text("Cancel"),
                //           )
                //         ],
                //       );
                //     });
              },
              color: Colors.redAccent,
              size: 20,
              iconSize: 20,
            ),
            ProfileWidget(
              titleText: "Logout",
              prefixIcon: "logout.svg",
              onPress: () {
                // showLoader(text: "Closing account....");
                showAdaptiveDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog.adaptive(
                        icon: const Icon(
                          Icons.warning,
                          size: 50,
                        ),
                        content: const Text("Are you sure you want logout?"),
                        actions: [
                          TextButton(
                            onPressed: () => AuthService().logout(),
                            child: const Text("Logout"),
                          ),
                          TextButton(
                            onPressed: () => Routes.pop(),
                            child: const Text("Cancel"),
                          )
                        ],
                      );
                    });
              },
              color: Colors.redAccent,
              size: 20,
              iconSize: 20,
            )
          ],
        ),
      ),
    );
  }
}
