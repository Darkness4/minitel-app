part of 'report_bloc.dart';

@freezed
abstract class ReportEvent with _$ReportEvent {
  const factory ReportEvent.toInitState() = ReportToInitState;
  const factory ReportEvent.share({
    @required @nullable String room,
    @required @nullable String name,
    @required @nullable String title,
    @required @nullable String description,
    @required @nullable Diagnosis diagnosis,
  }) = ReportToShare;
  const factory ReportEvent.slack({
    @required @nullable String room,
    @required @nullable String name,
    @required @nullable String title,
    @required @nullable String description,
    @required @nullable Diagnosis diagnosis,
    @Default("minitel_toolbox_notifications") String channel,
  }) = ReportToSlack;
  const factory ReportEvent.mail({
    @required @nullable String room,
    @required @nullable String name,
    @required @nullable String title,
    @required @nullable String description,
    @required @nullable Diagnosis diagnosis,
  }) = ReportToMail;
}
