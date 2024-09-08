import 'package:baseapp/app/theme.dart';
import 'package:baseapp/common/utils/size_utils.dart';
import 'package:flutter/material.dart';

class TitleDescriptionWidget extends StatelessWidget {
  final String title;
  final String description;
  final double horizontalPadding;
  final double topPadding;
  final double bottomPaddding;

  const TitleDescriptionWidget({
    super.key,
    required this.title,
    required this.description,
    this.bottomPaddding = 15,
    this.topPadding = 15,
    this.horizontalPadding = CustomTheme.symmetricHozPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: horizontalPadding,
        bottom: bottomPaddding,
        right: horizontalPadding,
        top: topPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: CustomTheme.displayMedium.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5.hp),
          Text(
            description,
            style: CustomTheme.titleLarge.copyWith(
              fontWeight: FontWeight.w400,
              color: CustomTheme.darkGrayColor,
            ),
          ),
        ],
      ),
    );
  }
}
