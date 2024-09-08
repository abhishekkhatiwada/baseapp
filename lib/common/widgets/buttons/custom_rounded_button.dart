import 'package:baseapp/app/theme.dart';
import 'package:baseapp/common/utils/size_utils.dart';
import 'package:flutter/material.dart';

class CustomRoundedButtom extends StatefulWidget {
  const CustomRoundedButtom({
    super.key,
    required this.title,
    required this.onPressed,
    this.isDisabled = false,
    this.isLoading = false,
    this.padding,
    this.color,
    this.horizontalPadding = 12,
    this.verticalPadding = 16,
    this.fontSize = 14,
    this.textColor = Colors.white,
    this.fontWeight = FontWeight.w700,
    this.horizontalMargin = 0,
    this.icon,
  });
  final String title;
  final Function()? onPressed;
  final bool isDisabled;
  final bool isLoading;
  final Color? color;
  final EdgeInsets? padding;
  final double horizontalPadding;
  final double verticalPadding;
  final double fontSize;
  final Color textColor;
  final FontWeight fontWeight;
  final double horizontalMargin;
  final IconData? icon;

  @override
  CustomRoundedButtomState createState() => CustomRoundedButtomState();
}

class CustomRoundedButtomState extends State<CustomRoundedButtom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: widget.horizontalMargin),
      child: Material(
        color: widget.isDisabled
            ? CustomTheme.lightGray
            : (widget.color ?? CustomTheme.primaryColor),
        borderRadius: BorderRadius.circular(30),
        child: InkWell(
          onTap: widget.isDisabled ? null : widget.onPressed,
          borderRadius: BorderRadius.circular(30),
          child: Container(
            padding: widget.padding ??
                EdgeInsets.symmetric(
                  vertical: widget.verticalPadding,
                  horizontal: widget.horizontalPadding,
                ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: widget.isDisabled
                  ? null
                  : Border.all(
                      color: widget.color ?? CustomTheme.primaryColor,
                    ),
            ),
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    widget.title,
                    style: CustomTheme.titleLarge.copyWith(
                      fontWeight: widget.fontWeight,
                      color: widget.isDisabled
                          ? CustomTheme.darkGrayColor
                          : widget.textColor,
                      fontSize: widget.fontSize,
                    ),
                  ),
                  if (widget.icon != null)
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 4.wp),
                      child: Icon(
                        widget.icon,
                        color: Colors.white,
                        size: 22,
                      ),
                    ),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 350),
                    switchInCurve: Curves.easeOut,
                    switchOutCurve: Curves.easeOut,
                    child: widget.isLoading
                        ? Container(
                            height: 14,
                            width: 14,
                            margin: const EdgeInsets.only(left: 8),
                            child: const CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2,
                            ),
                          )
                        : Container(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
