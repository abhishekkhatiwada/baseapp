import 'dart:async';
import 'package:baseapp/app/app_dev.dart';
import 'package:baseapp/common/constants/env.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  const bool isDevicePreviewEnabled = false;

  runApp(
    DevicePreview(
      enabled: isDevicePreviewEnabled,
      builder: (context) {
        return AppDev(
          env: EnvValue.development,
        );
      },
    ),
  );
}
