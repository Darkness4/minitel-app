part of 'diagnosis_bloc.dart';

@freezed
abstract class DiagnosisState with _$DiagnosisState {
  const factory DiagnosisState.initial(Diagnosis diagnosis) = DiagnosisInitial;
  const factory DiagnosisState.loading(Diagnosis diagnosis) = DiagnosisLoading;
  const factory DiagnosisState.loaded(Diagnosis diagnosis) = DiagnosisLoaded;
  const factory DiagnosisState.error(Exception error) = DiagnosisError;
}
