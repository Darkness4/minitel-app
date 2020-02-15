import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:minitel_toolbox/domain/entities/diagnosis.dart';
import 'package:minitel_toolbox/domain/repositories/diagnosis_repository.dart';

part 'diagnosis_event.dart';
part 'diagnosis_state.dart';

class DiagnosisBloc extends Bloc<DiagnosisEvent, DiagnosisState> {
  final DiagnosisRepository diagnosisRepository;

  DiagnosisBloc({@required this.diagnosisRepository});

  @override
  DiagnosisState get initialState =>
      DiagnosisInitial(diagnosis: diagnosisRepository.diagnosis);

  @override
  Stream<DiagnosisState> mapEventToState(
    DiagnosisEvent event,
  ) async* {
    if (event is DiagnosisRun) {
      try {
        await diagnosisRepository.diagnose();
        yield DiagnosisLoading(diagnosis: diagnosisRepository.diagnosis);
        await diagnosisRepository.diagnosis
            .waitAll()
            .timeout(const Duration(minutes: 1));
        yield DiagnosisLoaded(diagnosis: diagnosisRepository.diagnosis);
      } catch (e) {
        yield DiagnosisError(error: e);
      }
    } else if (event is DiagnosisCancel) {
      yield DiagnosisInitial(diagnosis: diagnosisRepository.diagnosis);
    }
  }
}
