part of 'diagnosis_cubit.dart';

@freezed
abstract class DiagnosisState with _$DiagnosisState {
  const factory DiagnosisState.initial(Diagnosis diagnosis) = DiagnosisInitial;
  const factory DiagnosisState.loading(Diagnosis diagnosis) = DiagnosisLoading;
  const factory DiagnosisState.loaded(Diagnosis diagnosis) = DiagnosisLoaded;
  const factory DiagnosisState.error(@nullable Diagnosis diagnosis,
      {@required Exception error}) = DiagnosisError;
}
