import 'package:url_launcher/url_launcher.dart';

class LaunchURL {
  static void launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  static Function mailToMarcNGUYEN =
      () => launchURL("mailto:nguyen_marc@live.fr");
  static Function githubDarkness4Releases =
      () => launchURL("https://github.com/Darkness4/minitel-app/releases");
  static Function githubDarkness4Issues =
      () => launchURL("https://github.com/Darkness4/minitel-app/issues");
  static Function messengerMarcNGUYEN =
      () => launchURL("https://www.messenger.com/t/100012919189214");
  static Function mailToMinitel =
      () => launchURL("mailto: minitelismin@gmail.com");
}
