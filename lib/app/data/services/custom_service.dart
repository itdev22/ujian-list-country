import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get_base_code/app/data/services/app_log.dart';
import 'package:get_base_code/app/utils/util_log.dart';

import 'share_prefference_service.dart';

class CustomService {
  Future<dynamic> request({
    required String title,
    required String url,
    required Method method,
    bool withToken = true,
    Map<String, dynamic> params = const {},
    Map<String, dynamic> queryParameters = const {},
    bool isMultipart = false,
  }) async {
    late Response response;
    Dio dio = Dio();
    late String token;

    try {
      //NOTE : CHECK WITH TOKEN

      if (withToken) {
        await SharedPrefferenceService().getToken().then((value) {
          token = value!;
        });

        log('token $token');

        dio = Dio(
          BaseOptions(
            contentType: isMultipart ? null : Headers.jsonContentType,
            receiveTimeout: const Duration(seconds: 30),
            connectTimeout: const Duration(seconds: 30),
            sendTimeout: const Duration(seconds: 30),
            headers: {
              'Authorization': 'Bearer $token',
            },
          ),
        );
      } else {
        token = '';
        dio = Dio(
          BaseOptions(
            receiveTimeout: const Duration(seconds: 30),
            connectTimeout: const Duration(seconds: 30),
            sendTimeout: const Duration(seconds: 30),
            contentType: Headers.jsonContentType,
          ),
        );
      }

      //NOTE : CHECK MULTIPART FOR IMAGE
      dynamic value =
          isMultipart ? await formData(params: params) : jsonEncode(params);

      //NOTE : CHECK METHOD API
      if (method == Method.GET) {
        response = await dio.get(
          url,
          queryParameters: queryParameters,
          data: value,
        );
      } else if (method == Method.POST) {
        response = await dio.post(
          url,
          data: value,
          queryParameters: queryParameters,
        );
      } else if (method == Method.DELETE) {
        response = await dio.delete(
          url,
          data: value,
          queryParameters: queryParameters,
        );
      } else if (method == Method.PUT) {
        response = await dio.put(
          url,
          data: value,
          queryParameters: queryParameters,
        );
      }

      //NOTE : CHECK RESPONSE STATUS
      UtilLog().logPrint(title: title, data: response.data.toString());

      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 204) {
        return response.data;
      }
    } on DioException catch (e) {
      logSys('message error : ${e.response!.statusCode}');
      var message = e.response!.data['message'].toString();

      logSys('message error : $message');

      throw Exception(message);
    }
  }

  Future<FormData> formData({required Map<String, dynamic> params}) async {
    return FormData.fromMap(params);
  }
}

enum Method { POST, GET, DELETE, PUT }
