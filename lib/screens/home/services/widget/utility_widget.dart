import "/exports/exports.dart";

class UtilityWidget extends StatelessWidget {
  final String icon;
  final Color color;
  final String route;
  final String label;
  const UtilityWidget({
    super.key,
    required this.route,
    required this.icon,
    required this.color,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TapEffect(
          onClick: () => route.isEmpty ? null : Routes.routeTo(route),
          child: CircleAvatar(
            backgroundColor: color.withAlpha(40),
            radius: 25,
            child: SvgPicture.asset(
              "assets/svgs/$icon.svg",
              width: 30,
              height: 30,
              color: color,
            ),
          ),
        ),
        Text(
          label,
          style: Theme.of(context).textTheme.titleSmall!.apply(
                fontWeightDelta: 5,
              ),
        ),
      ],
    );
  }
}
