import 'package:baseapp/app/theme.dart';
import 'package:baseapp/common/cubit/data_state.dart';
import 'package:baseapp/common/widgets/common_error_widget.dart';
import 'package:baseapp/common/widgets/common_loading_widget.dart';
import 'package:baseapp/common/widgets/page_wrapper.dart';
import 'package:baseapp/features/dashboard/cubit/cubit.dart';
import 'package:baseapp/features/dashboard/model/model.dart';
import 'package:baseapp/features/dashboard/ui/widgets/dashboard_buttom_bar.dart';
import 'package:baseapp/features/homepage/ui/screens/home_page.dart';
import 'package:baseapp/features/services/ui/screens/services_page.dart';
import 'package:baseapp/features/transactions/ui/screens/transaction_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardWidget extends StatefulWidget {
  const DashboardWidget({super.key});

  @override
  State<DashboardWidget> createState() => _DashboardWidgetState();
}

class _DashboardWidgetState extends State<DashboardWidget> {
  final PageController _pageController = PageController();
  final ValueNotifier<int> _selectedIndex = ValueNotifier(0);
  @override
  void initState() {
    super.initState();
    context.read<TransactionLimitCubit>().fetchTransactionLimit();
  }

  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      appBarColor: Colors.red,
      body: BlocBuilder<TransactionLimitCubit, CommonState>(
          builder: (context, state) {
        if (state is CommonLoading) {
          return const CommonLoadingWidget();
        } else if (state is CommonStateSuccess<FetchedList>) {
          return SizedBox(
              child: PageWrapper(
                  showAppBar: false,
                  padding: EdgeInsets.zero,
                  backgroundColor: CustomTheme.lightGray,
                  bottomNavBar: DashboardBottomBar(
                    pageController: _pageController,
                    selectedIndex: _selectedIndex,
                  ),
                  body: Stack(children: [
                    SizedBox(
                      child: PageView(
                        controller: _pageController,
                        physics: const NeverScrollableScrollPhysics(),
                        onPageChanged: (index) {
                          if (_selectedIndex.value != index) {
                            _selectedIndex.value = index;
                          }
                        },
                        children: [
                          const HomePage(),
                          const ServicesPage(),
                          Container(),
                          const TransactionPage(),
                          Container(),
                        ],
                      ),
                    ),
                  ])));
        } else if (state is CommonError) {
          return CommonErrorWidget(
              message: state.message, isNoConnection: false);
        } else {
          return Container();
        }
      }),
    );
  }
}
