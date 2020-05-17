part of 'report_bloc.dart';

@freezed
abstract class ReportState with _$ReportState {
  const factory ReportState.initial() = ReportInitial;
  const factory ReportState.loading() = ReportLoading;
  const factory ReportState.done(@nullable String status) = ReportDone;
  const factory ReportState.error(Exception error) = ReportError;
}
