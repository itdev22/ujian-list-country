import 'package:url_launcher/url_launcher.dart';

class UtilLaunchUrl {
  Future<void> launchInApp(Uri url) async {
    if (!await launchUrl(
      url,
      webOnlyWindowName: '_blank',
    )) {
      throw Exception('Could not launch $url');
    }
  }
}
