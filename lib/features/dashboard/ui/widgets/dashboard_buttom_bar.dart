import 'package:baseapp/app/theme.dart';
import 'package:baseapp/features/dashboard/enum/dashboard_page_type.dart';
import 'package:baseapp/features/dashboard/model/dashboard_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DashboardBottomBar extends StatefulWidget {
  final PageController pageController;
  final ValueNotifier<int> selectedIndex;
  const DashboardBottomBar({
    super.key,
    required this.pageController,
    required this.selectedIndex,
  });

  @override
  State<DashboardBottomBar> createState() => _DashboardBottomBarState();
}

class _DashboardBottomBarState extends State<DashboardBottomBar> {
  List<DashboardMenu> _items = [];

  @override
  void initState() {
    super.initState();
    _updateBottombarItem();
  }

  _updateBottombarItem() {
    setState(() {
      _items = [
        DashboardMenu(
          onPressed: () {
            widget.pageController.animateToPage(
              0,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
            );
          },
          title: "Home",
          selectedIcon: ('assets/icons/homef.svg'),
          unSelectedIcon: ('assets/icons/homeo.svg'),
          type: DashboardPageType.Home,
        ),
        DashboardMenu(
          onPressed: () {
            widget.pageController.animateToPage(
              1,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
            );
          },
          title: "Services",
          selectedIcon: ('assets/icons/servicef.svg'),
          unSelectedIcon: ('assets/icons/serviceo.svg'),
          type: DashboardPageType.Order,
        ),
        DashboardMenu(
          onPressed: () async {
            // final _cameraPermission =
            //     await PermissionUtils.isCameraPermissionAvailable;
            // if (_cameraPermission) {
            //   NavigationService.push(
            //     target: QRScannerScreens(
            //       onScanned: (user) {
            //         NavigationService.push(
            //           target: ScanAndPayScreens(
            //             mpqrcDetail: user,
            //           ),
            //         );
            //       },
            //       type: QRType.Scan,
            //     ),
            //   );
            // } else {
            //   showPopUpDialog(
            //       context: context,
            //       title: "Camera Permission",
            //       message:
            //           "You are currently trying to scan QR codes. You have not allowed Paywell to use your phone's camera. Without this permission, we won't be able to use your phone's camera to scan QR codes. Would you like to go to settings page to allow permission for camera usage ?",
            //       buttonCallback: () {
            //         AppSettings.openAppSettings();
            //       },
            //       showCancelButton: true,
            //       buttonText: "Yes");
            // }
          },
          title: 'Scan',
          selectedIcon: ('assets/icons/homeo.svg'),
          unSelectedIcon: ('assets/icons/homeo.svg'),
          type: DashboardPageType.Scan,
        ),
        DashboardMenu(
          onPressed: () {
            widget.pageController.animateToPage(
              3,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
            );
          },
          title: "Statement",
          selectedIcon: ('assets/icons/statementf.svg'),
          unSelectedIcon: ('assets/icons/statemento.svg'),
          type: DashboardPageType.Home,
        ),
        DashboardMenu(
          onPressed: () {
            //NavigationService.pushNamed(routeName: Routes.explore);
          },
          title: 'Explore',
          selectedIcon: ('assets/icons/profileo.svg'),
          unSelectedIcon: ('assets/icons/profilef.svg'),
          type: DashboardPageType.Explore,
        ),
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: CustomTheme.black,
            offset: Offset(0, 2),
            blurRadius: 17,
          )
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: NavigationBarTheme(
          data: NavigationBarThemeData(
            indicatorColor: Colors.transparent,
            labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
            labelTextStyle: WidgetStateProperty.resolveWith(
              (Set<WidgetState> states) {
                return CustomTheme.bodyLarge.copyWith(
                  color: CustomTheme.primaryColor,
                );
              },
            ),
            iconTheme: WidgetStateProperty.resolveWith(
              (Set<WidgetState> states) {
                return const IconThemeData(
                  color: CustomTheme.primaryColor,
                );
              },
            ),
          ),
          child: ValueListenableBuilder<int>(
            valueListenable: widget.selectedIndex,
            builder: (context, currentIndex, _) {
              return NavigationBar(
                backgroundColor: Colors.transparent,
                selectedIndex: currentIndex,
                onDestinationSelected: (index) {
                  _items[index].onPressed();
                  if (_items[index].type != DashboardPageType.Scan &&
                      _items[index].type != DashboardPageType.Explore) {
                    widget.selectedIndex.value = index;
                  }
                },
                destinations: List.generate(
                  _items.length,
                  (index) {
                    return NavigationDestination(
                      icon: SvgPicture.asset(
                        _items[index].unSelectedIcon,
                        // colorFilter: ColorFilter.mode(
                        //     CustomTheme.primaryColor, BlendMode.srcIn),
                        //size: 25,
                      ),
                      label: _items[index].title,
                      selectedIcon: SvgPicture.asset(
                        _items[index].selectedIcon,
                        // size: 25,
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
