// import 'dart:developer';

// import 'package:dio/dio.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:http_parser/http_parser.dart';
// import 'package:lini_mitra/app/data/services/share_prefference_service.dart';
// import 'package:lini_mitra/app/utils/lini_log.dart';
// import 'package:lini_mitra/app/utils/lini_snackbar.dart';
// import 'package:mime/mime.dart';

// class LiniUploadimageService {
//   final String filePath;
//   LiniUploadimageService({required this.filePath});
//   Future<dynamic> uploadImage() async {
//     Dio dio = Dio();
//     String token = '';
//     String baseUrl = dotenv.env['APP_ENV'] == 'dev'
//         ? dotenv.env['URL_UPLOAD_IMAGE_DEV'].toString()
//         : dotenv.env['URL_UPLOAD_IMAGE_PROD'].toString();

//     try {
//       final mimeTypeData =
//           lookupMimeType(filePath, headerBytes: [0xFF, 0xD8])!.split('/');

//       String fileName = filePath.split('/').last;

//       final formData = FormData.fromMap({
//         'image': await MultipartFile.fromFile(
//           filePath,
//           filename: fileName,
//           contentType: MediaType(
//             mimeTypeData[0],
//             mimeTypeData[1],
//           ),
//         ),
//       });

//       await SharedPrefferenceService().getToken().then((value) {
//         token = value!;
//       });

//       dio = Dio(
//         BaseOptions(
//           // contentType: null,
//           headers: {
//             'Authorization': 'Bearer $token',
//           },
//         ),
//       );

//       var response = await dio.post(baseUrl, data: formData);

//       if (response.statusCode == 200) {
//         LiniLog().logPrint(
//             title: 'Response ${response.statusCode}', data: '${response.data}');
//         return response.data;
//       }
//     } on DioException catch (e) {
//       LiniLog().logPrint(
//           title: 'Error Dio Imagessss', data: e.response!.data.toString());

//       LiniSnackBar().show(
//         title: 'Failed Upload Image',
//         message: 'Cek internet anda dan coba lagi',
//       );
//     }
//   }
// }
