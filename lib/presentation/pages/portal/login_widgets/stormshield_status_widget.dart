import 'package:flutter/material.dart';
import 'package:flutter_cubit/flutter_cubit.dart';
import 'package:minitel_toolbox/core/constants/localizations.dart';
import 'package:minitel_toolbox/presentation/cubits/portal/stormshield_status/stormshield_status_cubit.dart';
import 'package:minitel_toolbox/presentation/shared/keys.dart';

class StormshieldStatusWidget extends StatelessWidget {
  const StormshieldStatusWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CubitBuilder<StormshieldStatusCubit, StormshieldStatusState>(
      builder: (context, state) {
        return state.when(
          initial: () {
            return Column(
              children: <Widget>[
                const LinearProgressIndicator(value: 1.0),
                Text(
                  'Loading',
                  key: const Key(Keys.gatewayText),
                  style: TextStyle(
                    color: Theme.of(context).errorColor,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const LinearProgressIndicator(value: 1.0),
              ],
            );
          },
          loading: () {
            return Column(
              children: <Widget>[
                const LinearProgressIndicator(),
                Text(
                  'Loading',
                  key: const Key(Keys.gatewayText),
                  style: TextStyle(
                    color: Theme.of(context).errorColor,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const LinearProgressIndicator(),
              ],
            );
          },
          error: (e) {
            return Column(
              children: <Widget>[
                LinearProgressIndicator(
                  value: 0.0,
                  backgroundColor: Theme.of(context).errorColor,
                ),
                Text(
                  e.toString(),
                  key: const Key(Keys.gatewayText),
                  style: TextStyle(
                    color: Theme.of(context).errorColor,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                LinearProgressIndicator(
                  value: 0.0,
                  backgroundColor: Theme.of(context).errorColor,
                ),
              ],
            );
          },
          loaded: (status) {
            final duration = Duration(seconds: int.parse(status));
            if (duration.inSeconds < 300) {
              status =
                  AppLoc.of(context).portal.statusInSeconds(duration.inSeconds);
            } else if (duration.inMinutes < 60) {
              status =
                  AppLoc.of(context).portal.statusInMinutes(duration.inMinutes);
            } else {
              status = AppLoc.of(context)
                  .portal
                  .statusInHM(duration.inHours, duration.inMinutes % 60);
            }

            return Column(
              children: <Widget>[
                LinearProgressIndicator(
                  value: Duration(seconds: int.parse(status)).inSeconds / 28800,
                  backgroundColor: Theme.of(context).backgroundColor,
                ),
                Text(
                  status,
                  key: const Key(Keys.gatewayText),
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                LinearProgressIndicator(
                  value: Duration(seconds: int.parse(status)).inSeconds / 28800,
                  backgroundColor: Theme.of(context).backgroundColor,
                ),
              ],
            );
          },
        );
      },
    );
  }
}
