import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minitel_toolbox/data/database/diagnosis.dart';
import 'package:minitel_toolbox/presentation/cubits/reporting/diagnosis/diagnosis_cubit.dart';
import 'package:minitel_toolbox/presentation/shared/keys.dart';
import 'package:minitel_toolbox/presentation/pages/reporting/report_widgets/log_card.dart';

class DiagnoseScreen extends StatelessWidget {
  const DiagnoseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: BlocBuilder<DiagnosisCubit, DiagnosisState>(
        builder: (context, state) {
          final children2 = state.when(
            initial: _buildDiagnosisCards,
            loading: _buildDiagnosisCards,
            loaded: _buildDiagnosisCards,
            error: (diagnosis, error) {
              return [
                Text(
                  error.toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.center,
                )
              ];
            },
          );
          return ListView(
            key: const Key(Keys.diagnosisList),
            children: children2,
          );
        },
      ),
    );
  }

  List<Widget> _buildDiagnosisCards(Diagnosis diagnosis) {
    return diagnosis.entries
        .map((entry) => FutureBuilder<String>(
            future: entry.value.future,
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) =>
                LogCard(
                  _reportData(snapshot),
                  title: entry.key,
                  key: Key(Keys.diagnosisEntry(entry.key)),
                )))
        .toList();
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
        return snapshot.data!;
    }
  }
}
