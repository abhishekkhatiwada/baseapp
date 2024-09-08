import 'package:flutter/cupertino.dart';

class CommonLoadingWidget extends StatelessWidget {
  const CommonLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        'assets/gifs/Paywell.gif',
        height: 100,
        width: 100,
      ),
    );
  }
}
