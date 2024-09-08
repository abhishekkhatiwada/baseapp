import 'package:baseapp/app/theme.dart';
import 'package:baseapp/common/constants/constants.dart';
import 'package:baseapp/common/constants/env.dart';
import 'package:baseapp/common/routes/routes.dart';
import 'package:baseapp/common/routes/routes_generator.dart';
import 'package:baseapp/common/widgets/navigation/navigation.dart';
import 'package:baseapp/common/widgets/wrapper/multi_bloc_wrapper.dart';
import 'package:baseapp/common/widgets/wrapper/multi_repository_wrapper.dart';
import 'package:flutter/material.dart';

class AppDev extends StatefulWidget {
  final Env env;
  const AppDev({
    super.key,
    required this.env,
  });

  @override
  State<AppDev> createState() => _AppDevState();
}

class _AppDevState extends State<AppDev> {
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryWrapper(
      env: widget.env,
      child: MultiBlocWrapper(
        env: widget.env,
        child: MaterialApp(
          navigatorKey: NavigationService.navigationKey,
          debugShowCheckedModeBanner: true,
          darkTheme: CustomTheme.lightTheme,
          theme: CustomTheme.lightTheme,
          title: Constants.appTitle,
          initialRoute: Routes.root,
          onGenerateRoute: RouteGenerator.generateRoute,
        ),
      ),
    );
  }
}
