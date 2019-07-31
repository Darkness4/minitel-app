import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:minitel_toolbox/ui/shared/app_colors.dart';
import 'package:minitel_toolbox/ui/shared/text_styles.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';

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
          style: MinitelTextStyles.display2.apply(
            color: Colors.white,
            fontWeightDelta: 1,
            fontFamily: "Roboto",
          ),
        ),
      ),
    );
  }
}

class DayWidget extends StatelessWidget {
  final DateTime dt;
  final List<Widget> dailyEvents;

  const DayWidget(this.dt, this.dailyEvents);

  @override
  Widget build(BuildContext context) {
    return StickyHeaderBuilder(
      builder: (BuildContext context, double stuckAmount) {
        stuckAmount = 1.0 - stuckAmount.clamp(0.0, 1.0);
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0.0),
          child: Material(
            elevation: stuckAmount * 10,
            color: Color.lerp(
                Colors.transparent,
                MinitelColors.MonthColorPalette[dt.month].withOpacity(0.9),
                stuckAmount),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  "${DateFormat.MMMMEEEEd("fr_FR").format(dt)}",
                  style: Theme.of(context)
                      .textTheme
                      .headline
                      .apply(color: Colors.white),
                ),
              ),
            ),
          ),
        );
      },
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: dailyEvents,
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
