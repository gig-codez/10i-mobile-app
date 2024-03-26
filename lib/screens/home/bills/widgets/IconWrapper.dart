import "/exports/exports.dart";

class IconWrapper extends StatelessWidget {
  final String icon;
  final Color color;
  final double radius;
  final String keyText;
  const IconWrapper(
      {super.key,
      required this.icon,
      required this.color,
      this.radius = 50,
      this.keyText = ""});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SpaceWidget(space: 0.08),
        Center(
          child: CircleAvatar(
            backgroundColor: color.withAlpha(40),
            radius: radius,
            child: SvgPicture.asset(
              "assets/svgs/$icon.svg",
              width: 50,
              height: 50,
              color: color,
            ),
          ),
        ),
        const SpaceWidget(space: 0.05),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: "Pay $keyText Bill",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .apply(fontWeightDelta: 25),
              ),
              TextSpan(
                text:
                    "\n Pay ${keyText.toLowerCase()} bills safely, conveniently & easily. You pay anytime and anywhere",
                style: Theme.of(context).textTheme.bodyLarge!,
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
        const SpaceWidget(space: 0.05),
        Divider(color: Colors.grey.shade300),
      ],
    );
  }
}
