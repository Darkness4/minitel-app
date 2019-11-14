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
  DiagnosisState get initialState => const DiagnosisInitial();

  @override
  Stream<DiagnosisState> mapEventToState(
    DiagnosisEvent event,
  ) async* {
    if (event is DiagnosisRun) {
      try {
        final diagnosis = await diagnosisRepository.diagnose();
        yield DiagnosisLoading(diagnosis: diagnosis);
        await diagnosis.waitAll().timeout(const Duration(minutes: 1));
        yield DiagnosisLoaded(diagnosis: diagnosis);
      } catch (e) {
        yield DiagnosisError(error: e);
      }
    } else if (event is DiagnosisCancel) {
      yield const DiagnosisInitial();
    }
  }
}
