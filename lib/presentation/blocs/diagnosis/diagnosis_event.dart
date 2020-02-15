part of 'diagnosis_bloc.dart';

abstract class DiagnosisEvent extends Equatable {
  const DiagnosisEvent();
}

class DiagnosisRun extends DiagnosisEvent {
  const DiagnosisRun();

  @override
  List<Object> get props => [];
}

class DiagnosisCancel extends DiagnosisEvent {
  const DiagnosisCancel();

  @override
  List<Object> get props => [];
}
