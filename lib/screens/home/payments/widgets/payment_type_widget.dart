import "/exports/exports.dart";

class PaymentTypeWidget extends StatelessWidget {
  final String icon;
  final String title;
  final String subtitle;
  final Color? color;
  const PaymentTypeWidget(
      {super.key,
      required this.icon,
      required this.title,
      this.color,
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
          width: 3,
          color: color ?? Theme.of(context).primaryColor,
        ),
      ),
      child: ListTile(
        leading: SvgPicture.asset(
          "assets/svgs/$icon.svg",
          width: 50,
          height: 50,
        ),
        subtitle: Text(
          subtitle,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 18,
              ),
        ),
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.w800,
                fontSize: 20,
              ),
        ),
        trailing: Checkbox(
          value: false,
          onChanged: (value) {},
        ),
      ),
    );
  }
}
