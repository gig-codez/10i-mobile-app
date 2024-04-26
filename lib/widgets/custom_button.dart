import 'package:flutter/material.dart';

import '/exports/exports.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final double buttonHeight;
  final double buttonRadius;
  final Color? buttonColor;
  final Color? textColor;
  final double opacity;
  final bool loading;
  final IconData? icon;
  final double? width;
  final FontWeight? fontWeight;
  final VoidCallback onPress;
  const CustomButton(
      {super.key,
      this.text = '',
      this.loading = false,
      required this.onPress,
      this.buttonHeight = 50,
      this.buttonRadius = 20,
      this.buttonColor,
      this.icon,
      this.fontWeight,
      this.opacity = 0.12,
      this.textColor,
      this.width});

  @override
  Widget build(BuildContext context) {
    return TapEffect(
      onClick: onPress,
      child: Container(
        width: width ?? MediaQuery.of(context).size.width,
        height: buttonHeight,
        decoration: BoxDecoration(
          color: loading
              ? Colors.grey.shade200
              : buttonColor ??
                  Theme.of(context).primaryColor.withOpacity(opacity),
          borderRadius: BorderRadius.circular(buttonRadius),
        ),
        child: Center(
          child: loading
              ? const CircularProgressIndicator.adaptive()
              : icon == null
                  ? Text(
                      text,
                      style: Theme.of(context).textTheme.titleMedium!.apply(
                            color: textColor ?? Theme.of(context).primaryColor,
                            fontWeightDelta: 25,
                          ),
                      textAlign: TextAlign.center,
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                          Icon(
                            icon,
                            color: textColor ?? Theme.of(context).primaryColor,
                            weight: 50,
                          ),
                          const SpaceWidget(space: 0.02),
                          Text(
                            text,
                            style:
                                Theme.of(context).textTheme.titleMedium!.apply(
                                      color: textColor ??
                                          Theme.of(context).primaryColor,
                                      fontWeightDelta: 25,
                                    ),
                            textAlign: TextAlign.center,
                          ),
                        ]),
        ),
      ),
    );
  }
}
