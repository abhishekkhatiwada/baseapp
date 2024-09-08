import 'dart:async';
import 'package:baseapp/app/app_prod.dart';
import 'package:flutter/material.dart';
import 'common/constants/env.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    AppProd(env: EnvValue.production),
  );
}
