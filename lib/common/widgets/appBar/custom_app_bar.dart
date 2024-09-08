import 'package:baseapp/app/theme.dart';
import 'package:baseapp/common/utils/size_utils.dart';
import 'package:baseapp/common/widgets/buttons/custom_icon_button.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leadingIcon;
  final Widget? centerWidget;
  final List<Widget> actions;
  final PreferredSizeWidget? bottom;
  final Color? backgroundColor;
  final Color? tabBackgroundColor;
  final Color? iconBackgroundColor;
  final String? title;
  final bool showBottomBorder;
  final Function()? onBackPressed;
  final bool showBackButton;
  final bool centerMiddle;
  final double? leftPadding;
  final double? rightPadding;
  final double topPadding;
  const CustomAppBar({
    super.key,
    this.centerWidget,
    this.leadingIcon,
    this.bottom,
    this.backgroundColor,
    this.tabBackgroundColor,
    this.iconBackgroundColor,
    this.title,
    this.actions = const [],
    this.showBottomBorder = true,
    this.onBackPressed,
    this.centerMiddle = true,
    this.showBackButton = true,
    this.leftPadding,
    this.rightPadding,
    this.topPadding = 10,
  });

  @override
  Widget build(BuildContext context) {
    bool canPop = Navigator.of(context).canPop();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: Container(
            padding: EdgeInsets.only(
              left: leftPadding ?? CustomTheme.symmetricHozPadding.wp,
              right: rightPadding ?? CustomTheme.symmetricHozPadding.wp,
              top: MediaQuery.of(context).padding.top + topPadding,
            ),
            decoration: BoxDecoration(
              color: backgroundColor,
            ),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 65),
              child: NavigationToolbar(
                leading: leadingIcon != null
                    ? Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [leadingIcon!],
                      )
                    : ((showBackButton && canPop)
                        ? Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomIconButton(
                                icon: Icons.arrow_back_ios_new_rounded,
                                onPressed: onBackPressed ??
                                    () {
                                      Navigator.of(context).maybePop();
                                    },
                                shadow: false,
                                backgroundColor: iconBackgroundColor ??
                                    CustomTheme.lightGray,
                              ),
                            ],
                          )
                        : null),
                middle: title != null
                    ? Text(
                        title!,
                        style: CustomTheme.headlineMedium.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    : centerWidget,
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: actions,
                ),
                centerMiddle: centerMiddle,
                middleSpacing: NavigationToolbar.kMiddleSpacing,
              ),
            ),
          ),
        ),
        if (bottom != null)
          Container(
            color: tabBackgroundColor,
            child: bottom!,
          )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(160);
}
