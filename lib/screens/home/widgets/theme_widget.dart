import '/exports/exports.dart';

class ThemeWidget extends StatefulWidget {
  const ThemeWidget({super.key});

  @override
  State<ThemeWidget> createState() => _ThemeWidgetState();
}

class _ThemeWidgetState extends State<ThemeWidget> {
  int system = 1;
  int light = -1;
  int dark = -1;
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeController>(builder: (context, controller, x) {
      return Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Column(
          children: [
            RadioListTile.adaptive(
              value: controller.themeMode == ThemeMode.system ? 1 : -1,
              groupValue: 1,
              title: const Text("System Theme"),
              onChanged: (x) {
                controller.setThemeMode('system');
                Routes.pop();
              },
            ),
            RadioListTile.adaptive(
              value: controller.themeMode == ThemeMode.light ? 1 : -1,
              groupValue: 1,
              title: const Text("Light Theme"),
              onChanged: (x) {
                controller.setThemeMode('light');
                Routes.pop();
              },
            ),
            RadioListTile.adaptive(
              value: controller.themeMode == ThemeMode.dark ? 1 : -1,
              groupValue: 1,
              title: const Text("Dark Theme"),
              onChanged: (x) {
                controller.setThemeMode('dark');
                Routes.pop();
              },
            ),
          ],
        ),
      );
    });
  }
}
