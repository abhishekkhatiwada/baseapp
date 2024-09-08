import 'package:baseapp/features/dashboard/enum/dashboard_page_type.dart';

class DashboardMenu {
  final String selectedIcon;
  final String unSelectedIcon;
  final Function() onPressed;
  final String title;
  DashboardPageType type;

  DashboardMenu({
    required this.onPressed,
    required this.selectedIcon,
    required this.title,
    required this.unSelectedIcon,
    required this.type,
  });
}
