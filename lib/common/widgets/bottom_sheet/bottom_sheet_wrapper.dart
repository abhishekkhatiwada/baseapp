import 'package:baseapp/app/theme.dart';
import 'package:baseapp/common/utils/size_utils.dart';
import 'package:flutter/material.dart';

class BottomSheetWrapper extends StatelessWidget {
  final EdgeInsets? padding;
  final double? topPadding;
  final Widget child;
  final bool showTopDivider;
  final int widgetSpacing;
  final String? title;
  const BottomSheetWrapper({
    super.key,
    this.padding,
    this.topPadding,
    this.showTopDivider = true,
    this.widgetSpacing = 24,
    this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(
        top: Radius.circular(36),
      ),
      child: Container(
        padding: padding ??
            EdgeInsets.only(
              left: CustomTheme.symmetricHozPadding,
              right: CustomTheme.symmetricHozPadding,
              top: 30.hp,
              bottom: 10.hp,
            ),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(36),
          ),
          color: CustomTheme.backgroundColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (title != null)
              Text(
                title!,
                style: CustomTheme.titleLarge.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            if (showTopDivider)
              Container(
                height: 4,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: CustomTheme.lightGray,
                ),
              ),
            SizedBox(height: widgetSpacing.hp),
            child,
          ],
        ),
      ),
    );
  }
}
