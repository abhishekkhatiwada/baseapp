import 'package:baseapp/app/theme.dart';
import 'package:baseapp/common/utils/size_utils.dart';
import 'package:flutter/material.dart';

class CustomIconWithTextButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final void Function()? onPressed;
  final Color? backgroundColor;
  final double borderRadius;
  final Color textColor;
  const CustomIconWithTextButton({
    super.key,
    required this.icon,
    required this.title,
    this.onPressed,
    this.backgroundColor,
    this.borderRadius = 13,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(borderRadius),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(borderRadius),
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 12.wp,
            horizontal: 10.wp,
          ),
          decoration: const BoxDecoration(),
          child: Column(
            children: [
              Icon(
                icon,
                color: Colors.white,
                size: 30,
              ),
              SizedBox(height: 5.hp),
              Text(
                title,
                style: CustomTheme.titleLarge.copyWith(
                  letterSpacing: 0.5,
                  fontSize: SizeUtils.isSmallPhone ? 13 : 14,
                  color: textColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
