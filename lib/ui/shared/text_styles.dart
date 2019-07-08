import 'package:flutter/material.dart';
import 'package:minitel_toolbox/ui/shared/app_colors.dart';

class MinitelTextStyles {
  // Flutter Theme
  static const body1 = TextStyle(
    height: 1.2,
    fontWeight: FontWeight.normal,
    color: MinitelColors.FontColor,
  );
  static const body2 = TextStyle(
    height: 1.2,
    fontWeight: FontWeight.bold,
    color: MinitelColors.FontColor,
  );
  static const headline = TextStyle(
    height: 1.5,
    fontWeight: FontWeight.bold,
    color: MinitelColors.FontColor,
  );
  static const title = TextStyle(
    height: 1.5,
    fontWeight: FontWeight.bold,
    color: MinitelColors.FontColor,
  );
  static const display1 = TextStyle(height: 1.5);
  static const display2 = TextStyle(height: 1.5);
  static const display3 = TextStyle(height: 1.5);
  static const display4 = TextStyle(height: 1.5);
  static const subhead = TextStyle(
    height: 1.5,
    color: MinitelColors.FontColor,
  );
  static const subtitle = TextStyle(
    height: 1.5,
    color: MinitelColors.FontColor,
  );

  // Markdown Style
  static const mdH1 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w600,
    height: 1.25,
    color: Color(0xff24292e),
  );
  static const mdH2 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    height: 1.25,
    color: Color(0xff24292e),
  );
  static const mdH3 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    height: 1.25,
    color: Color(0xff24292e),
  );
  static const mdH4 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 1.25,
    color: Color(0xff24292e),
  );
  static const mdH5 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 1.25,
    color: Color(0xff24292e),
  );
  static const mdH6 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    height: 1.25,
    color: Color(0xff6a737d),
  );
  static const mdBody = TextStyle(
    fontSize: 16,
    height: 1.5,
    color: Color(0xff24292e),
  );

  // Others Style
  static const error = TextStyle(
    color: Colors.red,
    fontWeight: FontWeight.bold,
    fontSize: 20,
  );
  static const appTitle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: Colors.black54,
  );
}

class BoxMdBody extends StatelessWidget {
  final Text _text;
  const BoxMdBody(Text text, {Key key})
      : _text = text,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.0),
      child: _text,
    );
  }
}

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
          margin: EdgeInsets.fromLTRB(0, 24, 0, 16),
          padding: EdgeInsets.only(bottom: 9.6),
          child: Text(
            _text,
            style: MinitelTextStyles.mdH1,
          ),
          decoration: BoxDecoration(
            border: BorderDirectional(
              bottom: BorderSide(color: Color.fromRGBO(234, 236, 239, 1.0)),
            ),
          ),
        );
        break;

      case 2:
        return Container(
          margin: EdgeInsets.fromLTRB(0, 24, 0, 16),
          padding: EdgeInsets.only(bottom: 7.2),
          child: Text(
            _text,
            style: MinitelTextStyles.mdH2,
          ),
          decoration: BoxDecoration(
            border: BorderDirectional(
              bottom: BorderSide(color: Color.fromRGBO(234, 236, 239, 1.0)),
            ),
          ),
        );
        break;

      case 3:
        return Container(
          margin: EdgeInsets.fromLTRB(0, 24, 0, 16),
          child: Text(
            _text,
            style: MinitelTextStyles.mdH3,
          ),
        );
        break;

      case 4:
        return Container(
          margin: EdgeInsets.fromLTRB(0, 24, 0, 16),
          child: Text(
            _text,
            style: MinitelTextStyles.mdH4,
          ),
        );
        break;

      case 5:
        return Container(
          margin: EdgeInsets.fromLTRB(0, 24, 0, 16),
          child: Text(
            _text,
            style: MinitelTextStyles.mdH5,
          ),
        );
        break;

      case 6:
        return Container(
          margin: EdgeInsets.fromLTRB(0, 24, 0, 16),
          child: Text(
            _text,
            style: MinitelTextStyles.mdH6,
          ),
        );
        break;

      default:
    }
  }
}
