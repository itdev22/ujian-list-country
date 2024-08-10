import 'package:get/get.dart';

class SplashscreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  initSplash() async {
    await Future.delayed(const Duration(seconds: 2));
    Get.offAndToNamed('/home');
  }
}
