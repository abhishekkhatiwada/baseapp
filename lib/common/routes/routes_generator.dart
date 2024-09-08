import 'package:baseapp/common/routes/routes.dart';
import 'package:baseapp/features/dashboard/ui/screens/dashboard_screen.dart';
import 'package:baseapp/features/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.root:
        return PageTransition(
          child: const SplashScreen(),
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          settings: settings,
        );

      case Routes.dashboard:
        return PageTransition(
          child: const DashboardPage(),
          type: PageTransitionType.fade,
          settings: settings,
          alignment: Alignment.center,
        );

      default:
        return PageTransition(
          child: const SplashScreen(),
          type: PageTransitionType.fade,
          settings: settings,
          alignment: Alignment.center,
        );
    }
  }
}
