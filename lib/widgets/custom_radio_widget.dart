import "/exports/exports.dart";

class CustomRadioWidget extends StatelessWidget {
  final String label;
  final int groupValue;
  final int value;
  final ValueChanged<int?>? onChanged;
  final Widget? icon;
  const CustomRadioWidget({
    super.key,
    required this.label,
    required this.groupValue,
    required this.value,
    required this.onChanged,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(
          color: Colors.grey.shade300,
        ),
      ),
      child: RadioListTile(
        value: value,
        groupValue: groupValue,
        onChanged: onChanged,
        title: Text(label),
        secondary: icon,
      ),
    );
  }
}
