part of 'diagnosis_bloc.dart';

@freezed
abstract class DiagnosisEvent with _$DiagnosisEvent {
  const factory DiagnosisEvent.run() = DiagnosisRun;
  const factory DiagnosisEvent.cancel() = DiagnosisCancel;
}
