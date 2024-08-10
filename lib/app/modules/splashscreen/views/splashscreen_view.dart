import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_base_code/app/config/config.dart';

import '../controllers/splashscreen_controller.dart';

class SplashscreenView extends GetView<SplashscreenController> {
  const SplashscreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    controller.initSplash();
    return Scaffold(
      backgroundColor: AppColor.mainColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon(
            //   Icons.star_rate_sharp,
            //   size: 100,
            //   color: AppColor.white1,
            // ),
            Image.asset(
              'assets/images/map.png',
              height: 100,
              width: 100,
            ),
            20.0.height,
            Text(
              'Country State List',
              style: AppFont.interWhite1.copyWith(
                fontWeight: AppFont.bold,
                fontSize: 30.sp,
              ),
            )
          ],
        ),
      ),
    );
  }
}
