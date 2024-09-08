import 'package:baseapp/app/theme.dart';
import 'package:baseapp/common/utils/size_utils.dart';
import 'package:baseapp/common/widgets/buttons/custom_rounded_button.dart';
import 'package:flutter/material.dart';

class CommonErrorWidget extends StatelessWidget {
  final String message;
  final String description;
  final String imageUrl;
  final bool isNoConnection;
  final Function()? onReloadPressed;
  final double horizontalPadding;
  const CommonErrorWidget({
    super.key,
    required this.message,
    this.imageUrl = "",
    this.description = "",
    required this.isNoConnection,
    this.onReloadPressed,
    this.horizontalPadding = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeUtils.width,
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            isNoConnection
                ? 'no internet image here '
                : (imageUrl.isNotEmpty ? imageUrl : 'assets/icons/error.png'),
            height: isNoConnection ? null : 175.hp,
            width: isNoConnection ? SizeUtils.width : null,
          ),
          SizedBox(height: 20.hp),
          Text(
            isNoConnection ? 'No Internet Connection' : message,
            textAlign: TextAlign.center,
            style: CustomTheme.titleLarge.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          if (description.isNotEmpty || isNoConnection) SizedBox(height: 20.hp),
          if (description.isNotEmpty || isNoConnection)
            Text(
              isNoConnection
                  ? 'No Internet Connection'
                  : (description.isNotEmpty ? description : ""),
              textAlign: TextAlign.center,
              style: CustomTheme.titleLarge.copyWith(
                fontWeight: FontWeight.w400,
              ),
            ),
          SizedBox(height: 20.hp),
          if (onReloadPressed != null)
            Container(
              padding: EdgeInsets.only(bottom: 20.hp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomRoundedButtom(
                    title: 'Reload',
                    icon: Icons.refresh_rounded,
                    onPressed: onReloadPressed,
                    horizontalPadding: 32,
                    verticalPadding: 14,
                  ),
                ],
              ),
            )
        ],
      ),
    );
  }
}
