import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minitel_toolbox/core/constants/localizations.dart';
import 'package:minitel_toolbox/presentation/blocs/portal_status/portal_status_bloc.dart';
import 'package:minitel_toolbox/presentation/shared/keys.dart';

class StatusCard extends StatelessWidget {
  const StatusCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PortalStatusBloc, PortalStatusState>(
        builder: (context, state) {
      return Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        elevation: 10.0,
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _buildStormshieldStatusWidget(context, state),
              _buildCalendarStatusWidget(context, state),
              _buildPortailStatusWidget(context, state),
              _buildImprimanteStatusWidget(context, state),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildImprimanteStatusWidget(
      BuildContext context, PortalStatusState state) {
    return Row(
      children: <Widget>[
        Text(
          "${AppLoc.of(context).portal.apps.printer}: ",
          style: const TextStyle(fontSize: 20),
        ),
        if (state.printerIsSuccess)
          Icon(
            Icons.done,
            color: Theme.of(context).accentColor,
            key: const Key(Keys.imprimanteSuccess),
          )
        else
          Icon(
            Icons.close,
            color: Theme.of(context).errorColor,
          )
      ],
    );
  }

  Widget _buildPortailStatusWidget(
      BuildContext context, PortalStatusState state) {
    return Row(
      children: <Widget>[
        Text(
          "${AppLoc.of(context).portal.apps.portal}: ",
          style: const TextStyle(fontSize: 20),
        ),
        if (state.portalIsSuccess)
          Icon(
            Icons.done,
            color: Theme.of(context).accentColor,
            key: const Key(Keys.portailSuccess),
          )
        else
          Icon(
            Icons.close,
            color: Theme.of(context).errorColor,
          )
      ],
    );
  }

  Widget _buildCalendarStatusWidget(
      BuildContext context, PortalStatusState state) {
    return Row(
      children: <Widget>[
        Text(
          "${AppLoc.of(context).agenda.title}: ",
          style: const TextStyle(fontSize: 20),
        ),
        if (state.calendarIsSuccess)
          Icon(
            Icons.done,
            color: Theme.of(context).accentColor,
            key: const Key(Keys.agendaSuccess),
          )
        else
          Icon(
            Icons.close,
            color: Theme.of(context).errorColor,
          )
      ],
    );
  }

  Widget _buildStormshieldStatusWidget(
    BuildContext context,
    PortalStatusState state,
  ) {
    if (state.stormshieldIsSuccess) {
      String status = '';
      final Duration duration =
          Duration(seconds: int.parse(state.stormshieldState));
      if (duration.inSeconds < 300) {
        status = AppLoc.of(context).portal.statusInSeconds(duration.inSeconds);
      } else if (duration.inMinutes < 60) {
        status = AppLoc.of(context).portal.statusInMinutes(duration.inMinutes);
      } else {
        status = AppLoc.of(context)
            .portal
            .statusInHM(duration.inHours, duration.inMinutes % 60);
      }

      return Column(
        children: <Widget>[
          LinearProgressIndicator(
            value:
                Duration(seconds: int.parse(state.stormshieldState)).inSeconds /
                    28800,
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
            value:
                Duration(seconds: int.parse(state.stormshieldState)).inSeconds /
                    28800,
            backgroundColor: Theme.of(context).backgroundColor,
          ),
        ],
      );
    } else {
      return Column(
        children: <Widget>[
          LinearProgressIndicator(
            value: 0.0,
            backgroundColor: Theme.of(context).errorColor,
          ),
          Text(
            state.stormshieldState,
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
    }
  }
}
