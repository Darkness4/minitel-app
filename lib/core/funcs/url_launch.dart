import 'package:url_launcher/url_launcher.dart';

/// Url Launcher
class LaunchURL {
  static Function mailToMarcNGUYEN =
      () => launchURL("mailto:nguyen_marc@live.fr");
  static Function githubDarkness4Releases =
      () => launchURL("https://github.com/Darkness4/minitel-app/releases");
  static Function githubDarkness4Issues =
      () => launchURL("https://github.com/Darkness4/minitel-app/issues");
  static Function messengerMarcNGUYEN =
      () => launchURL("https://www.messenger.com/t/100012919189214");
  static Function mailToMinitel =
      () => launchURL("mailto:minitelismin@gmail.com");
  static Function minitelWebsite = () => launchURL("https://minitel.emse.fr/");

  static Function dualBootTutorial = () => LaunchURL.launchURL(
      "https://docs.google.com/document/d/1VvgkIRjPEQ6O8Usyt30cRhIRVOyR4a7SYPGuNX2ORvU/edit?usp=sharing");

  /// Launche the given url
  static Future<void> launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw Exception('Could not launch $url');
    }
  }
}
