import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:minitel_toolbox/data/database/diagnosis.dart';
import 'package:minitel_toolbox/domain/repositories/diagnosis_repository.dart';

part 'diagnosis_cubit.freezed.dart';
part 'diagnosis_state.dart';

@injectable
class DiagnosisCubit extends Cubit<DiagnosisState> {
  final DiagnosisRepository diagnosisRepository;

  DiagnosisCubit({required this.diagnosisRepository})
      : super(DiagnosisState.initial(diagnosisRepository.diagnosis));

  void diagnosisCancel() {
    emit(DiagnosisState.initial(diagnosisRepository.diagnosis));
  }

  Future<void> diagnosisRun() async {
    try {
      await diagnosisRepository.diagnose();
      emit(DiagnosisState.loading(diagnosisRepository.diagnosis));
      await diagnosisRepository.diagnosis.waitAll();
      emit(DiagnosisState.loaded(diagnosisRepository.diagnosis));
    } on Exception catch (e) {
      emit(DiagnosisState.error(null, error: e));
    }
  }
}
