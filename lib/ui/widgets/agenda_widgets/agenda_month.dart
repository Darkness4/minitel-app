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
}

class MonthPage extends StatelessWidget {
  final int _month;
  final List<Widget> _monthlyWidgets;

  const MonthPage(this._month, this._monthlyWidgets, {Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          color: MinitelColors.MonthColorPalette[_month],
          elevation: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: _monthlyWidgets,
          ),
        ),
      ),
    );
  }
}
