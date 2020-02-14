import 'package:url_launcher/url_launcher.dart' as url_launcher;

class LaunchURLUtils {
  /// Launch the given url
  static Future<void> launchURL(String url) async {
    if (await url_launcher.canLaunch(url)) {
      await url_launcher.launch(url);
    } else {
      throw Exception('Could not launch $url');
    }
  }
}
