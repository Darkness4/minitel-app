import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:minitel_toolbox/ui/shared/app_colors.dart';

class MonthHeader extends StatelessWidget {
  final String text;
  const MonthHeader(this.text);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          text,
          style: Theme.of(context).textTheme.display2.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('text', text));
  }
}

class MonthPage extends StatelessWidget {
  final int _month;
  final List<Widget> _monthlyWidgets;

  const MonthPage(this._month, this._monthlyWidgets, {Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(5, 5, 5, 0),
      color: Theme.of(context).brightness == Brightness.light
          ? MinitelColors.MonthColorPalette[_month]
          : Theme.of(context).cardColor,
      elevation: 4,
      child: Scrollbar(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: _monthlyWidgets,
        ),
      ),
    );
  }
}
