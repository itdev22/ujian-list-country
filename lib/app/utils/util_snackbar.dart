import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../config/theme/app_color.dart';

class UtilSnackBar {
  void show({
    required String title,
    required String message,
    int second = 3,
    Color color = const Color(0xffEF5350),
  }) {
    Get.snackbar(
      title,
      message,
      mainButton: TextButton(
        onPressed: () {
          Get.closeCurrentSnackbar();
        },
        child: Icon(Icons.close, color: AppColor.white1),
      ),
      margin: const EdgeInsets.fromLTRB(24, 40, 24, 0),
      snackPosition: SnackPosition.TOP,
      backgroundColor: color,
      duration: Duration(seconds: second),
      colorText: AppColor.white1,
      icon: Icon(Icons.info, color: AppColor.white1),
      messageText: Text(
        message,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: AppColor.white1,
        ),
      ),
      isDismissible: true,
    );
  }
}
