import "/exports/exports.dart";

class CustomSelectWidget extends StatelessWidget {
  final EdgeInsetsGeometry? padding;
  final String displayText;
  final double borderRadius;
  final Color color;
  final int borderThickness;
  final TextAlign? textAlign;
  final VoidCallback onTap;
  const CustomSelectWidget({
    super.key,
    this.padding,
    this.borderRadius = 10,
    required this.onTap,
    this.borderThickness = 1,
    this.color = Colors.grey,
    this.textAlign,
    required this.displayText,
  });

  @override
  Widget build(BuildContext context) {
    return TapEffect(
      onClick: onTap,
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          side: BorderSide(
            color: color,
            width: 1,
          ),
        ),
        child: Padding(
          padding: padding ?? const EdgeInsets.fromLTRB(14, 18, 18, 18),
          child: Text(
            displayText,
            style: Theme.of(context).textTheme.titleMedium!.apply(
                  fontWeightDelta: 5,
                ),
            textAlign: textAlign,
          ),
        ),
      ),
    );
  }
}
