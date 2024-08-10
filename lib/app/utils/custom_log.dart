import 'dart:developer';

class CustomLog {
  Future<void> logPrint({required String title, required dynamic data}) async {
    log('----------------------------Response $title-------------------------------------------------------\n$data\n------------------------------end $title---------------------------------------------------------');
  }
}
