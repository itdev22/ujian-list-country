// import 'dart:convert';
// import 'dart:developer';

// import 'package:dio/dio.dart';
// import 'package:lini_mitra/app/data/services/share_prefference_service.dart';
// import 'package:lini_mitra/app/data/src/enum.dart';
// import 'package:lini_mitra/app/utils/lini_log.dart';
// import 'package:get/route_manager.dart';

// class CustomDioService {
//   Future<dynamic> request({
//     required String title,
//     required String url,
//     required MethodDio method,
//     bool withToken = true,
//     Map<String, dynamic> params = const {},
//     Map<String, dynamic> queryParameters = const {},
//     bool isMultipart = false,
//   }) async {
//     late Response response;
//     Dio dio = Dio();
//     late String token;

//     try {
//       //NOTE : CHECK WITH TOKEN

//       if (withToken) {
//         await SharedPrefferenceService().getToken().then((value) {
//           token = value!;
//         });

//         dio = Dio(
//           BaseOptions(
//             contentType: isMultipart ? null : Headers.jsonContentType,
//             // receiveTimeout: 15000,
//             // connectTimeout: 15000,
//             // sendTimeout: 15000,
//             headers: {
//               'Authorization': 'Bearer $token',
//             },
//           ),
//         );
//       } else {
//         token = '';
//         dio = Dio(
//           BaseOptions(
//             // receiveTimeout: 15000,
//             // connectTimeout: 15000,
//             // sendTimeout: 15000,
//             contentType: Headers.jsonContentType,
//           ),
//         );
//       }

//       //NOTE : CHECK MULTIPART FOR IMAGE
//       dynamic value =
//           isMultipart ? await formData(params: params) : jsonEncode(params);

//       //NOTE : CHECK METHOD API
//       if (method == MethodDio.GET) {
//         response = await dio.get(
//           url,
//           queryParameters: queryParameters,
//         );
//       } else if (method == MethodDio.POST) {
//         response = await dio.post(
//           url,
//           data: value,
//           queryParameters: queryParameters,
//         );
//       } else if (method == MethodDio.DELETE) {
//         response = await dio.delete(
//           url,
//           queryParameters: queryParameters,
//         );
//       } else if (method == MethodDio.PUT) {
//         response = await dio.put(
//           url,
//           data: value,
//           queryParameters: queryParameters,
//         );
//       }

//       //NOTE : CHECK RESPONSE STATUS
//       LiniLog().logPrint(title: title, data: response.data);

//       if (response.statusCode == 200) {
//         return response.data;
//       } else if (response.statusCode == 204) {
//         return response.data;
//       }
//     } on DioException catch (e) {
//       log('dio error ${e.type}');
//       log('dio error ${e.response!.statusCode}');

//       String message =
//           e.response == null ? '' : e.response!.data['message'] ?? '';

//       //if token invalid back to splashscreen
//       if (e.response!.data['code'].toString() == 'invalid_token') {
//         log('do this logout');
//         SharedPrefferenceService().clear();
//         Get.offNamedUntil('/splashscreen', (route) => false);
//       }

//       //print error
//       LiniLog().logPrint(title: title, data: message);

//       //custom handle error

//       throw Exception(e.response!.data);
//     }
//   }

//   Future<FormData> formData({required Map<String, dynamic> params}) async {
//     return FormData.fromMap(params);
//   }
// }
