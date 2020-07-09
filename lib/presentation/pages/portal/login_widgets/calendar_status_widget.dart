import 'package:flutter/material.dart';
import 'package:flutter_cubit/flutter_cubit.dart';
import 'package:minitel_toolbox/core/constants/localizations.dart';
import 'package:minitel_toolbox/presentation/blocs/portal/calendar_status/calendar_status_cubit.dart';
import 'package:minitel_toolbox/presentation/shared/keys.dart';

class CalendarStatusWidget extends StatelessWidget {
  const CalendarStatusWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          '${AppLoc.of(context).agenda.title}: ',
          style: const TextStyle(fontSize: 20),
        ),
        CubitBuilder<CalendarStatusCubit, CalendarStatusState>(
          builder: (context, state) {
            return state.maybeWhen(
              loaded: (success) {
                if (success) {
                  return Icon(
                    Icons.done,
                    color: Theme.of(context).accentColor,
                    key: const Key(Keys.agendaSuccess),
                  );
                } else {
                  return Icon(
                    Icons.close,
                    color: Theme.of(context).errorColor,
                  );
                }
              },
              orElse: () {
                return Icon(
                  Icons.close,
                  color: Theme.of(context).errorColor,
                );
              },
            );
          },
        ),
      ],
    );
  }
}
