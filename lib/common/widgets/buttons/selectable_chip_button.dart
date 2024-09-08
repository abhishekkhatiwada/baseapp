import 'package:baseapp/app/theme.dart';
import 'package:baseapp/common/utils/size_utils.dart';
import 'package:flutter/material.dart';

class SelectableChipButton extends StatelessWidget {
  final bool isSelected;
  final String title;
  final Function()? onPressed;
  final EdgeInsets? margin;
  const SelectableChipButton({
    super.key,
    required this.title,
    required this.isSelected,
    this.onPressed,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(100),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: Border.all(
              width: 1.wp,
              color: isSelected ? Colors.transparent : CustomTheme.primaryColor,
            ),
            color: isSelected ? CustomTheme.primaryColor : Colors.white,
          ),
          padding: EdgeInsets.symmetric(vertical: 12.wp, horizontal: 24.wp),
          child: Text(
            title,
            style: CustomTheme.titleLarge.copyWith(
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.white : CustomTheme.primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
