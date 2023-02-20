import 'dart:io';

import 'package:url_launcher/url_launcher.dart';

class UrlLauncher {
  UrlLauncher._();

  static void launch(String url) async {
    final Uri uri = Uri.parse(url);

    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $uri');
    }
  }

  static void whatsapp({required String phone, required String message}) async {
    var contact = "+880123232333";
    var androidUrl = "whatsapp://send?phone=$phone&text=$message";
    var iosUrl = "https://wa.me/$phone?text=${Uri.parse(message)}";

    try {
      if (Platform.isIOS) {
        await launchUrl(Uri.parse(iosUrl));
      } else {
        await launchUrl(Uri.parse(androidUrl));
      }
    } on Exception {
      throw Exception('WhatsApp is not installed.');
    }
  }
}
