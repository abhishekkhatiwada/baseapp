import 'package:baseapp/app/theme.dart';
import 'package:flutter/material.dart';

class CustomOutlineButton extends StatelessWidget {
  final String title;
  final Color? textColor;
  final Color? borderColor;
  final Function()? onPressed;
  final double horizontalPadding;
  final double verticalPadding;
  final double fontSize;
  final FontWeight fontWeight;

  const CustomOutlineButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.borderColor,
    this.textColor,
    this.horizontalPadding = 12,
    this.verticalPadding = 16,
    this.fontSize = 14,
    this.fontWeight = FontWeight.w700,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(30),
      color: CustomTheme.backgroundColor,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(30),
        child: Container(
          padding: EdgeInsets.symmetric(
              vertical: verticalPadding, horizontal: horizontalPadding),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(
              color: borderColor ?? CustomTheme.primaryColor,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Text(
            title,
            style: CustomTheme.titleLarge.copyWith(
              fontWeight: fontWeight,
              fontSize: fontSize,
              color: textColor ?? CustomTheme.primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
