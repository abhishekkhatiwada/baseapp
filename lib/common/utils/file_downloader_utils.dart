// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_downloader/flutter_downloader.dart';
// import 'package:setup/common/enum/file_type.dart';
// import 'package:setup/common/utils/custom_toast.dart';
// import 'package:setup/common/utils/file_utils.dart';

// class FileDownloadUtils {
//   static Future<String?> downloadFile({
//     required String downloadLink,
//     required String fileName,
//     required BuildContext context,
//   }) async {
//     final String? _downloadPath = await FileUtils.getDownloadPath;
//     // final _token = RepositoryProvider.of<UserRepository>(context).token;

//     if (_downloadPath != null) {
//       final String? _taskID = await FlutterDownloader.enqueue(
//         url: downloadLink,
//         savedDir: _downloadPath,
//         fileName: fileName,
//         showNotification: true,
//         openFileFromNotification: true,
//         saveInPublicStorage: true,
//         headers: {"Authorization": "Bearer "},
//       );
//       if (_taskID != null) {
//         CustomToast.success(message: 'Downloading');
//       }
//       return _taskID;
//     } else {
//       return null;
//     }
//   }

//   static String generateDownloadFileName(
//       {required String name, required FileType filetype}) {
//     final timeStamp = DateTime.now().millisecondsSinceEpoch;
//     return "$name $timeStamp.${filetype.extension}";
//   }
// }
