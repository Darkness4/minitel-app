import 'package:intl/intl.dart';

class NewsLoc {
  final String localeName;
  NewsLoc(this.localeName);

  String get title => Intl.message(
        'Nouveautés',
        name: 'NewsLoc_title',
        locale: localeName,
      );

  String get seeFacebook => Intl.message(
        "Voir sur Facebook ...",
        name: 'NewsLoc_seeFacebook',
        locale: localeName,
      );
}
