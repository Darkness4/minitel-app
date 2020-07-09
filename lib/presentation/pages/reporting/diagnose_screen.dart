import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minitel_toolbox/core/constants/diagnosis_keys.dart';
import 'package:minitel_toolbox/presentation/blocs/diagnosis/diagnosis_bloc.dart';
import 'package:minitel_toolbox/presentation/shared/app_colors.dart';
import 'package:minitel_toolbox/presentation/shared/keys.dart';
import 'package:minitel_toolbox/presentation/widgets/cards/log_card.dart';

class DiagnoseScreen extends StatelessWidget {
  const DiagnoseScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: BlocBuilder<DiagnosisBloc, DiagnosisState>(
        builder: (context, state) {
          final children2 = <Widget>[
            if (state is DiagnosisError)
              Text(
                state.error.toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                  fontSize: 15,
                ),
                textAlign: TextAlign.center,
              ),
            if (state is DiagnosisLoading ||
                state is DiagnosisLoaded ||
                state is DiagnosisInitial)
              Center(
                child: Chip(
                  elevation: 2.0,
                  backgroundColor: MinitelColors.reportPrimaryColor,
                  label: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: FutureBuilder<String>(
                      future: state.diagnosis[DiagnosisKeys.ip].future,
                      builder: (BuildContext context,
                          AsyncSnapshot<String> ipSnapshot) {
                        var output = '${DiagnosisKeys.ip}: ';
                        output += ipSnapshot.hasData ? ipSnapshot.data : '';
                        return Text(
                          output,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            if (state is DiagnosisLoading ||
                state is DiagnosisLoaded ||
                state is DiagnosisInitial)
              for (final entry in state.diagnosis.entries)
                if (entry.key != DiagnosisKeys.ip) // Ignore them
                  FutureBuilder<String>(
                    future: entry.value.future,
                    builder: (BuildContext context,
                            AsyncSnapshot<String> snapshot) =>
                        LogCard(
                      _reportData(snapshot),
                      title: entry.key,
                      key: Key(Keys.diagnosisEntry(entry.key)),
                    ),
                  ),
          ];
          return ListView(
            key: const Key(Keys.diagnosisList),
            children: children2,
          );
        },
      ),
    );
  }

  String _reportData(AsyncSnapshot<String> snapshot) {
    if (snapshot.hasError) {
      return '${snapshot.error}';
    }
    switch (snapshot.connectionState) {
      case ConnectionState.none:
        return '';
      case ConnectionState.active:
      case ConnectionState.waiting:
        return '...';
      case ConnectionState.done:
        return snapshot.data;
    }
    return null;
  }
}
