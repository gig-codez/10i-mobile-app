import '/exports/exports.dart';

class DividerWidget extends StatelessWidget {
  final String text;
  const DividerWidget({super.key, this.text = "or"});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
        child: Divider(
          thickness: 1,
          color: Colors.grey.shade300,
        ),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(13, 3, 13, 3),
        child: Text(text, style: Theme.of(context).textTheme.bodyLarge),
      ),
      Expanded(
        child: Divider(
          thickness: 1,
          color: Colors.grey.shade300,
        ),
      ),
    ]);
  }
}
