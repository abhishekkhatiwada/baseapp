import 'package:baseapp/app/theme.dart';
import 'package:flutter/material.dart';

showLoadingDialogBox(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return const LoadingDialogBox();
    },
  );
}

class LoadingDialogBox extends StatelessWidget {
  const LoadingDialogBox({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 40),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/gifs/Paywell.gif',
                height: 80,
                width: 80,
              ),
              const SizedBox(height: 14),
              Text(
                "Loading...",
                style: CustomTheme.titleLarge.copyWith(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
