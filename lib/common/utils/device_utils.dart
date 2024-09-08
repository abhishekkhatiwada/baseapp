import 'dart:io';

import 'package:android_id/android_id.dart';
import 'package:baseapp/common/utils/custom_log.dart';
import 'package:baseapp/common/utils/text_utils.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:device_marketing_names/device_marketing_names.dart';
import 'package:fk_user_agent/fk_user_agent.dart';
import 'package:package_info_plus/package_info_plus.dart';

class DeviceUtils {
  static final DeviceUtils _deviceUtils = DeviceUtils._internal();

  factory DeviceUtils() {
    return _deviceUtils;
  }

  DeviceUtils._internal();

  static final DeviceInfoPlugin _deviceInfo = DeviceInfoPlugin();

  static String _deviceId = "";

  static String _marketingName = "";

  static String _userAgent = "";

  static String _appVersion = "";

  static Future<String> get getDeviceId async {
    if (_deviceId.isNotEmpty) {
      return _deviceId;
    }
    try {
      if (Platform.isAndroid) {
        _deviceId = await const AndroidId().getId() ?? "";
        return _deviceId;
      } else if (Platform.isIOS) {
        final res = await _deviceInfo.iosInfo;
        _deviceId = res.identifierForVendor ?? "";
        return _deviceId;
      }
      return _deviceId;
    } catch (e) {
      return _deviceId;
    }
  }

  static Future<String> get getAppVersion async {
    if (_appVersion.isNotEmpty) {
      return _appVersion;
    } else {
      final PackageInfo packageInfo = await PackageInfo.fromPlatform();
      _appVersion = packageInfo.version;
      return _appVersion;
    }
  }

  static Future<String> get getAppName async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.appName;
  }

  static Future<String> get getPackageName async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.packageName;
  }

  static Future<String> get getMarketingName async {
    if (_marketingName.isNotEmpty) {
      return _marketingName;
    }
    try {
      if (Platform.isAndroid) {
        final res = await _deviceInfo.androidInfo;
        final String manufactureName = res.manufacturer.capitalize();
        final String model = res.model;
        final deviceMarketNames = DeviceMarketingNames();
        final String deviceName =
            deviceMarketNames.getNamesFromModel(DeviceType.android, model);
        _marketingName =
            deviceName.isNotEmpty ? deviceName : "$manufactureName $model";
        return _marketingName;
      } else if (Platform.isIOS) {
        final res = await _deviceInfo.iosInfo;
        final deviceMarketNames = DeviceMarketingNames();
        String iosName = deviceMarketNames.getSingleNameFromModel(
            DeviceType.ios, res.utsname.machine);
        if (iosName.isEmpty) {
          iosName = "APPLE iPhone (iPhone)";
        }
        _marketingName = iosName;
        return iosName;
      }
      return _marketingName;
    } catch (e) {
      return _marketingName;
    }
  }

  static Future<String> get userAgent async {
    try {
      if (_userAgent.isNotEmpty) {
        return _userAgent;
      } else {
        await FkUserAgent.init();
        _userAgent = FkUserAgent.userAgent ?? "";
        CustomLog.log("Flutter User Agent : $_userAgent");
        return _userAgent;
      }
    } catch (e) {
      return "";
    }
  }

  static Future<Map<String, String>> get deviceInfoHeader async {
    final uAgent = await userAgent;
    final deviceId = await getDeviceId;
    final marketName = await getMarketingName;
    final aVersion = await getAppVersion;
    return {
      "user_agent": uAgent,
      "device": deviceId,
      "software_version": aVersion,
      "model": marketName,
    };
  }
}
