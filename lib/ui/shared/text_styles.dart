import 'package:flutter/material.dart';
import 'package:minitel_toolbox/ui/shared/app_colors.dart';

/// Markdown-style body
class BoxMdBody extends StatelessWidget {
  final Text _text;
  const BoxMdBody(Text text, {Key key})
      : _text = text,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: _text,
    );
  }
}

/// Markdown-style header
class BoxMdH extends StatelessWidget {
  final String _text;
  final int _level;
  const BoxMdH(String text, int level, {Key key})
      : _text = text,
        _level = level,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (_level) {
      case 1:
        return Container(
          margin: const EdgeInsets.fromLTRB(0, 24, 0, 16),
          padding: const EdgeInsets.only(bottom: 9.6),
          decoration: const BoxDecoration(
            border: BorderDirectional(
              bottom: BorderSide(
                color: Color.fromRGBO(234, 236, 239, 1.0),
              ),
            ),
          ),
          child: Text(
            _text,
            style: MinitelTextStyles.mdH1,
          ),
        );
        break;

      case 2:
        return Container(
          margin: const EdgeInsets.fromLTRB(0, 24, 0, 16),
          padding: const EdgeInsets.only(bottom: 7.2),
          decoration: const BoxDecoration(
            border: BorderDirectional(
              bottom: BorderSide(
                color: Color.fromRGBO(234, 236, 239, 1.0),
              ),
            ),
          ),
          child: Text(
            _text,
            style: MinitelTextStyles.mdH2,
          ),
        );
        break;

      case 3:
        return Container(
          margin: const EdgeInsets.fromLTRB(0, 24, 0, 16),
          child: Text(
            _text,
            style: MinitelTextStyles.mdH3,
          ),
        );
        break;

      case 4:
        return Container(
          margin: const EdgeInsets.fromLTRB(0, 24, 0, 16),
          child: Text(
            _text,
            style: MinitelTextStyles.mdH4,
          ),
        );
        break;

      case 5:
        return Container(
          margin: const EdgeInsets.fromLTRB(0, 24, 0, 16),
          child: Text(
            _text,
            style: MinitelTextStyles.mdH5,
          ),
        );
        break;

      case 6:
        return Container(
          margin: const EdgeInsets.fromLTRB(0, 24, 0, 16),
          child: Text(
            _text,
            style: MinitelTextStyles.mdH6,
          ),
        );
        break;

      default:
        return Container();
    }
  }
}

/// Main Text Styles of the app
class MinitelTextStyles {
  // Flutter Theme
  static const TextStyle body1 = TextStyle(
    height: 1.2,
    fontWeight: FontWeight.normal,
    color: MinitelColors.FontColor,
  );
  static const TextStyle body2 = TextStyle(
    height: 1.2,
    fontWeight: FontWeight.bold,
    color: MinitelColors.FontColor,
  );
  static const TextStyle headline = TextStyle(
    height: 1.5,
    fontWeight: FontWeight.bold,
    color: MinitelColors.FontColor,
  );
  static const TextStyle title = TextStyle(
    height: 1.5,
    fontWeight: FontWeight.bold,
    color: MinitelColors.FontColor,
  );
  static const TextStyle display1 = TextStyle(height: 1.5);
  static const TextStyle display2 = TextStyle(height: 1.5);
  static const TextStyle display3 = TextStyle(height: 1.5);
  static const TextStyle display4 = TextStyle(height: 1.5);
  static const TextStyle subhead = TextStyle(
    height: 1.5,
    color: MinitelColors.FontColor,
  );
  static const TextStyle subtitle = TextStyle(
    height: 1.5,
    color: MinitelColors.FontColor,
  );

  // Markdown Style
  static const TextStyle mdH1 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w600,
    height: 1.25,
    color: Color(0xff24292e),
  );
  static const TextStyle mdH2 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    height: 1.25,
    color: Color(0xff24292e),
  );
  static const TextStyle mdH3 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    height: 1.25,
    color: Color(0xff24292e),
  );
  static const TextStyle mdH4 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 1.25,
    color: Color(0xff24292e),
  );
  static const TextStyle mdH5 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 1.25,
    color: Color(0xff24292e),
  );
  static const TextStyle mdH6 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    height: 1.25,
    color: Color(0xff6a737d),
  );
  static const TextStyle mdBody = TextStyle(
    fontSize: 16,
    height: 1.5,
    color: Color(0xff24292e),
  );

  // Others Style
  static const TextStyle error = TextStyle(
    color: Colors.red,
    fontWeight: FontWeight.bold,
    fontSize: 20,
  );
  static const TextStyle appTitle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: Colors.black54,
  );

  static const TextTheme textTheme = TextTheme(
    body1: body1,
    body2: body2,
    headline: headline,
    title: mdH2,
    display1: display1,
    display2: display2,
    display3: display3,
    display4: display4,
    subtitle: subtitle,
    subhead: subhead,
  );
}
