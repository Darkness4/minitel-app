import 'package:minitel_toolbox/core/utils/launch_url_utils.dart';

class LaunchURLConstants {
  static Future<void> Function() mailToMarcNGUYEN =
      () => LaunchURLUtils.launchURL("mailto:nguyen_marc@live.fr");
  static Future<void> Function() githubDarkness4Releases = () =>
      LaunchURLUtils.launchURL(
          "https://github.com/Darkness4/minitel-app/releases");
  static Future<void> Function() githubDarkness4Issues = () =>
      LaunchURLUtils.launchURL(
          "https://github.com/Darkness4/minitel-app/issues");
  static Future<void> Function() messengerMarcNGUYEN = () =>
      LaunchURLUtils.launchURL("https://www.messenger.com/t/100012919189214");
  static Future<void> Function() mailToMinitel =
      () => LaunchURLUtils.launchURL("mailto:minitelismin@gmail.com");
  static Future<void> Function() minitelWebsite =
      () => LaunchURLUtils.launchURL("https://minitel.emse.fr/");

  static Future<void> Function() dualBootTutorial = () => LaunchURLUtils.launchURL(
      "https://docs.google.com/document/d/1VvgkIRjPEQ6O8Usyt30cRhIRVOyR4a7SYPGuNX2ORvU/edit?usp=sharing");
}
