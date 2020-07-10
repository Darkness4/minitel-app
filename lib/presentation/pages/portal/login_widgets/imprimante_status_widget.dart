import 'package:flutter/material.dart';
import 'package:flutter_cubit/flutter_cubit.dart';
import 'package:minitel_toolbox/core/constants/localizations.dart';
import 'package:minitel_toolbox/presentation/cubits/portal/imprimante_status/imprimante_status_cubit.dart';
import 'package:minitel_toolbox/presentation/shared/keys.dart';

class ImprimanteStatusWidget extends StatelessWidget {
  const ImprimanteStatusWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          '${AppLoc.of(context).portal.apps.printer}: ',
          style: const TextStyle(fontSize: 20),
        ),
        CubitBuilder<ImprimanteStatusCubit, ImprimanteStatusState>(
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
