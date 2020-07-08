import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:minitel_toolbox/domain/entities/diagnosis.dart';
import 'package:minitel_toolbox/domain/repositories/diagnosis_repository.dart';

part 'diagnosis_bloc.freezed.dart';
part 'diagnosis_event.dart';
part 'diagnosis_state.dart';

class DiagnosisBloc extends Bloc<DiagnosisEvent, DiagnosisState> {
  final DiagnosisRepository diagnosisRepository;

  DiagnosisBloc({@required this.diagnosisRepository})
      : assert(diagnosisRepository != null),
        super(DiagnosisState.initial(diagnosisRepository.diagnosis));

  @override
  Stream<DiagnosisState> mapEventToState(
    DiagnosisEvent event,
  ) async* {
    yield* event.when(
      run: _mapDiagnosisRunToState,
      cancel: _mapDiagnosisCancelToState,
    );
  }

  Stream<DiagnosisState> _mapDiagnosisCancelToState() async* {
    yield DiagnosisState.initial(diagnosisRepository.diagnosis);
  }

  Stream<DiagnosisState> _mapDiagnosisRunToState() async* {
    try {
      await diagnosisRepository.diagnose();
      yield DiagnosisState.loading(diagnosisRepository.diagnosis);
      await diagnosisRepository.diagnosis.waitAll();
      yield DiagnosisState.loaded(diagnosisRepository.diagnosis);
    } on Exception catch (e) {
      yield DiagnosisState.error(null, error: e);
    }
  }
}
