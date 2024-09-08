import 'package:baseapp/common/utils/custom_toast.dart';
import 'package:dio/dio.dart';

Future<Response> requestRetrier({
  required String baseUrl,
  required Response response,
  required int? userId,
  bool authErrorToastShown = false,
}) async {
  CustomToast.error(message: 'SessionTimedOut');
  authErrorToastShown = true;
  Future.delayed(const Duration(seconds: 3), () {
    authErrorToastShown = false;
  });
  return response;
}
