part of 'agenda_bloc.dart';

abstract class AgendaEvent extends Equatable {
  const AgendaEvent();

  @override
  List<Object> get props => [];
}

class AgendaLoad extends AgendaEvent {
  final NotificationSettings notificationSettings;
  const AgendaLoad({@required this.notificationSettings});

  @override
  List<Object> get props => [notificationSettings];
}

class AgendaDownload extends AgendaEvent {
  final String uid;
  final String pswd;
  final NotificationSettings notificationSettings;

  const AgendaDownload({
    @required this.uid,
    @required this.pswd,
    @required this.notificationSettings,
  });

  @override
  List<Object> get props => [
        this.uid,
        this.pswd,
        this.notificationSettings,
      ];
}
