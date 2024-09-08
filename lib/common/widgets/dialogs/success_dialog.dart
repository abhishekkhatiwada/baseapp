import 'dart:math';
import 'package:baseapp/app/theme.dart';
import 'package:baseapp/common/utils/size_utils.dart';
import 'package:baseapp/common/widgets/buttons/custom_rounded_button.dart';
import 'package:baseapp/common/widgets/navigation/navigation.dart';
import 'package:flutter/material.dart';

showSuccessDialog({
  required BuildContext context,
  required String description,
  required String title,
  required IconData icon,
  bool rotate = true,
}) async {
  showDialog(
    context: context,
    builder: (context) {
      return SuccessDialog(
        description: description,
        icon: icon,
        title: title,
        rotate: rotate,
      );
    },
  );
}

class SuccessDialog extends StatelessWidget {
  final String description;
  final IconData icon;
  final String title;
  final bool rotate;
  const SuccessDialog({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    required this.rotate,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 24,
          horizontal: 24,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(30),
              decoration: const BoxDecoration(
                color: CustomTheme.gray,
                shape: BoxShape.circle,
              ),
              child: Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationX(rotate ? pi : 0),
                child: Icon(
                  icon,
                  color: CustomTheme.primaryColor,
                  size: 40,
                ),
              ),
            ),
            SizedBox(height: 24.hp),
            Align(
              alignment: Alignment.center,
              child: Text(
                title,
                style: CustomTheme.titleLarge.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 12.hp),
            Text(
              description,
              textAlign: TextAlign.center,
              style: CustomTheme.titleLarge.copyWith(
                fontWeight: FontWeight.w400,
                color: CustomTheme.darkGrayColor,
              ),
            ),
            SizedBox(height: 24.hp),
            CustomRoundedButtom(
              title: 'Done',
              verticalPadding: 14,
              onPressed: () {
                NavigationService.pop();
                NavigationService.pop();
              },
            )
          ],
        ),
      ),
    );
  }
}
