import 'package:intl/intl.dart';

class NewsLoc {
  final String localeName;
  NewsLoc(this.localeName);

  String get title => Intl.message(
        'Nouveautés',
        name: 'NewsLoc_title',
        locale: localeName,
      );

  String get seeTwitter => Intl.message(
        "Voir sur Twitter ...",
        name: 'NewsLoc_seeTwitter',
        locale: localeName,
      );
}
