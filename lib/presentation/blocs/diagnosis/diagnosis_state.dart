part of 'diagnosis_bloc.dart';

abstract class DiagnosisState extends Equatable {
  Diagnosis get diagnosis;
  const DiagnosisState();

  @override
  bool get stringify => true;
}

class DiagnosisInitial extends DiagnosisState {
  @override
  final Diagnosis diagnosis;

  const DiagnosisInitial({@required this.diagnosis});

  @override
  List<Object> get props => [];
}

class DiagnosisLoading extends DiagnosisState {
  @override
  final Diagnosis diagnosis;

  const DiagnosisLoading({@required this.diagnosis});

  @override
  List<Object> get props => [diagnosis];
}

class DiagnosisLoaded extends DiagnosisState {
  @override
  final Diagnosis diagnosis;

  const DiagnosisLoaded({@required this.diagnosis});

  @override
  List<Object> get props => [diagnosis];
}

class DiagnosisError extends DiagnosisState {
  @override
  Diagnosis get diagnosis => null;

  final dynamic error;

  const DiagnosisError({@required this.error});

  @override
  List<Object> get props => [error];
}
