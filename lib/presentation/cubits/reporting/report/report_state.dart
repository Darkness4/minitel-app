part of 'report_cubit.dart';

@freezed
class ReportState with _$ReportState {
  const factory ReportState.initial() = ReportInitial;
  const factory ReportState.loading() = ReportLoading;
  const factory ReportState.done(String status) = ReportDone;
  const factory ReportState.error(Exception error) = ReportError;
}
