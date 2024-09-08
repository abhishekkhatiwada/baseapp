import 'package:permission_handler/permission_handler.dart';

class PermissionUtils {
  static Future<bool> get isCameraPermissionAvailable async {
    final res = await Permission.camera.request();
    return res.isGranted || res.isLimited;
  }
}
