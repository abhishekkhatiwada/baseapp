import 'package:baseapp/app/theme.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class DottedIconButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final IconData icon;
  final double iconSize;
  final double size;
  final double leftMargin;
  final double rightMargin;
  final Color color;
  const DottedIconButton({
    super.key,
    this.onPressed,
    required this.icon,
    this.iconSize = 34,
    this.size = 60,
    this.leftMargin = 0,
    this.rightMargin = 0,
    this.color = CustomTheme.gray,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: leftMargin, right: rightMargin),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(100),
        child: DottedBorder(
          borderType: BorderType.RRect,
          dashPattern: const [8, 4],
          radius: const Radius.circular(100),
          color: color,
          child: Container(
            height: size,
            width: size,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              size: iconSize,
              color: color,
            ),
          ),
        ),
      ),
    );
  }
}
