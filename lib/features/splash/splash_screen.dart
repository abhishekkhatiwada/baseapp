import 'package:baseapp/common/utils/size_utils.dart';
import 'package:baseapp/common/widgets/navigation/navigation.dart';
import 'package:baseapp/features/dashboard/ui/screens/dashboard_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    check();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final height = SizeUtils.height;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(size.aspectRatio * 80),
          child: Image.asset(
            'assets/images/splash.jpg',
            height: height * 0.8,
          ),
        ),
      ),
    );
  }

  check() async {
    Future.delayed(const Duration(seconds: 3), () async {
      await NavigationService.pushReplacement(target: const DashboardPage());
      // Navigator.pushReplacement(
      //     context,
      //     MaterialPageRoute(
      //       builder: (context) => const DashboardPage(),
      //     ));
    });
  }
}
