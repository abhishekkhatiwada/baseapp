import 'package:baseapp/app/theme.dart';
import 'package:baseapp/common/enum/floating_action_button_type.dart';
import 'package:baseapp/common/utils/size_utils.dart';
import 'package:baseapp/common/widgets/appBar/custom_app_bar.dart';
import 'package:flutter/material.dart';

class PageWrapper extends StatefulWidget {
  final bool useOwnAppBar;
  final Widget body;
  final bool useOwnScaffold;
  final bool showAppBar;
  final PreferredSizeWidget? appBar;
  final String? title;
  final Widget? leadingAppIcon;
  final List<Widget> appActions;
  final EdgeInsets? padding;
  final double appBarLeftPadding;
  final double appBarRightPadding;
  final Widget? floatinActionButton;
  final Widget? bottomNavBar;
  final Color? backgroundColor;
  final Color? appBarColor;
  final FloatingActionButtonLocation floatingActionButtonLocation;
  final FloatingActionButtonType floatingActionButtonType;
  final Function()? onBackPressed;
  const PageWrapper({
    super.key,
    this.useOwnAppBar = false,
    required this.body,
    this.useOwnScaffold = false,
    this.showAppBar = true,
    this.appBar,
    this.appActions = const [],
    this.leadingAppIcon,
    this.title,
    this.padding,
    this.bottomNavBar,
    this.appBarColor,
    this.appBarLeftPadding = CustomTheme.symmetricHozPadding,
    this.appBarRightPadding = CustomTheme.symmetricHozPadding,
    this.floatinActionButton,
    this.backgroundColor,
    this.floatingActionButtonLocation =
        FloatingActionButtonLocation.centerDocked,
    this.floatingActionButtonType = FloatingActionButtonType.button,
    this.onBackPressed,
  });
  @override
  State<PageWrapper> createState() => _PageWrapperState();
}

class _PageWrapperState extends State<PageWrapper> {
  @override
  Widget build(BuildContext context) {
    if (widget.useOwnScaffold) {
      return widget.body;
    } else {
      return Scaffold(
        floatingActionButton:
            widget.floatingActionButtonType == FloatingActionButtonType.button
                ? (widget.floatinActionButton != null
                    ? AnimatedSwitcher(
                        duration: const Duration(milliseconds: 50),
                        child: MediaQuery.of(context).viewInsets.bottom > 0
                            ? Container()
                            : Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(
                                      left: CustomTheme.symmetricHozPadding,
                                      right: CustomTheme.symmetricHozPadding,
                                      bottom: 20.hp,
                                    ),
                                    child: widget.floatinActionButton,
                                  ),
                                ],
                              ),
                      )
                    : null)
                : widget.floatinActionButton,
        backgroundColor: widget.backgroundColor,
        bottomNavigationBar: widget.bottomNavBar,
        floatingActionButtonLocation: widget.floatingActionButtonLocation,
        appBar: widget.showAppBar
            ? (widget.useOwnAppBar
                ? widget.appBar
                : CustomAppBar(
                    backgroundColor: widget.appBarColor,
                    actions: widget.appActions,
                    title: widget.title,
                    leftPadding: widget.appBarLeftPadding,
                    rightPadding: widget.appBarLeftPadding,
                    leadingIcon: widget.leadingAppIcon,
                    onBackPressed: widget.onBackPressed,
                  ))
            : null,
        body: Container(
          padding: widget.padding ??
              const EdgeInsets.symmetric(
                horizontal: CustomTheme.symmetricHozPadding,
              ),
          child: widget.body,
        ),
      );
    }
  }
}
