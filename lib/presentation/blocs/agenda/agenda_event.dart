part of 'agenda_bloc.dart';

@freezed
abstract class AgendaEvent with _$AgendaEvent {
  const factory AgendaEvent.load(
      {@required NotificationSettings notificationSettings}) = AgendaLoad;
  const factory AgendaEvent.download({
    @required String uid,
    @required String pswd,
    @required NotificationSettings notificationSettings,
  }) = AgendaDownload;
}
