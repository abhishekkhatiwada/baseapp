import 'dart:async';
import 'package:baseapp/app/app_prod.dart';
import 'package:baseapp/common/constants/env.dart';
import 'package:baseapp/common/utils/custom_log.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runZonedGuarded(() {
    runApp(
      AppProd(env: EnvValue.production),
    );
  }, (e, s) {
    CustomLog.errorLog(e);
    CustomLog.actionLog(s);
  });
}
