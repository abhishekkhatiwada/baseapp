import 'package:baseapp/app/theme.dart';
import 'package:baseapp/common/constants/constants.dart';
import 'package:baseapp/common/constants/env.dart';
import 'package:baseapp/common/routes/routes.dart';
import 'package:baseapp/common/routes/routes_generator.dart';
import 'package:baseapp/common/widgets/global_error_widget.dart';
import 'package:baseapp/common/widgets/navigation/navigation.dart';
import 'package:baseapp/common/widgets/wrapper/multi_bloc_wrapper.dart';
import 'package:baseapp/common/widgets/wrapper/multi_repository_wrapper.dart';
import 'package:flutter/material.dart';

class AppProd extends StatefulWidget {
  final Env env;
  const AppProd({super.key, required this.env});

  @override
  State<AppProd> createState() => _AppProdState();
}

class _AppProdState extends State<AppProd> {
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryWrapper(
      env: widget.env,
      child: MultiBlocWrapper(
        env: widget.env,
        child: MaterialApp(
          navigatorKey: NavigationService.navigationKey,
          builder: (context, Widget? widget) {
            setErrorBuilder(context);
            return widget!;
          },
          debugShowCheckedModeBanner: false,
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
