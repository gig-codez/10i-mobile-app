import "/exports/exports.dart";

class ContactDetail extends StatelessWidget {
  final String titleText;
  final bool selected;
  final String subText;
  final IconData icon;
  final VoidCallback onPress;
  const ContactDetail(
      {super.key,
      required this.titleText,
      required this.subText,
      this.selected = false,
      required this.onPress,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return TapEffect(
      onClick: onPress,
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
          side: BorderSide(
            color: selected
                ? Theme.of(context).primaryColor
                : Colors.grey.shade300,
            width: 1.75,
          ),
        ),
        child: ListTile(
          title: Text(
            titleText,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          subtitle: Text(
            subText,
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .apply(fontWeightDelta: 8),
          ),
          leading: CircleAvatar(
            radius: 20,
            child: Icon(
              icon,
              color: Theme.of(context).primaryColor,
              size: 20,
            ),
          ),
        ),
      ),
    );
  }
}
