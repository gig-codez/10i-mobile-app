import "/exports/exports.dart";

class PaymentTypeWidget extends StatelessWidget {
  final ValueChanged<int?>? onSelected;
  final int value;
  final String title;
  final bool selected;
  final String subtitle;

  const PaymentTypeWidget({
    super.key,
    required this.onSelected,
    required this.value,
    required this.title,
    this.selected = false,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
        side: BorderSide(
          width: 1,
          color: selected
              ? Theme.of(context).primaryColor
              : const Color.fromARGB(118, 182, 182, 182),
        ),
      ),
      child: RadioListTile.adaptive(
        selected: selected,
        activeColor: selected
            ? Theme.of(context).primaryColor
            : const Color.fromARGB(118, 182, 182, 182),
        value: value,
        groupValue: 1,
        onChanged: onSelected,
        subtitle: Text(
          subtitle,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 15,
              ),
        ),
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.w800,
                fontSize: 18,
              ),
        ),
      ),
    );
  }
}
