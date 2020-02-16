part of 'report_bloc.dart';

abstract class ReportState extends Equatable {
  const ReportState();

  @override
  bool get stringify => true;
}

class ReportInitial extends ReportState {
  const ReportInitial();
  @override
  List<Object> get props => [];
}

class ReportLoading extends ReportState {
  const ReportLoading();
  @override
  List<Object> get props => [];
}

class ReportDone extends ReportState {
  final String status;

  const ReportDone(this.status);

  @override
  List<Object> get props => [status];
}

class ReportError extends ReportState {
  final dynamic error;

  const ReportError({@required this.error});

  @override
  List<Object> get props => [error];
}
