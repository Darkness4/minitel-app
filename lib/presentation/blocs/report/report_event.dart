part of 'report_bloc.dart';

abstract class ReportEvent extends Equatable {
  const ReportEvent();

  @override
  bool get stringify => true;
}

class ReportToInitState extends ReportEvent {
  @override
  List<Object> get props => [];
}

class ReportToShare extends ReportEvent {
  final String room;
  final String name;
  final String title;
  final String description;
  final Diagnosis diagnosis;

  const ReportToShare({
    @required this.room,
    @required this.name,
    @required this.title,
    @required this.description,
    @required this.diagnosis,
  });

  @override
  List<Object> get props => [
        this.room,
        this.name,
        this.title,
        this.description,
        this.diagnosis,
      ];
}

class ReportToSlack extends ReportEvent {
  final String room;
  final String name;
  final String title;
  final String description;
  final Diagnosis diagnosis;
  final String channel;

  const ReportToSlack({
    @required this.room,
    @required this.name,
    @required this.title,
    @required this.description,
    @required this.diagnosis,
    this.channel = "minitel_toolbox_notifications",
  });

  @override
  List<Object> get props => [
        this.room,
        this.name,
        this.title,
        this.description,
        this.diagnosis,
        this.channel,
      ];
}

class ReportToMail extends ReportEvent {
  final String room;
  final String name;
  final String title;
  final String description;
  final Diagnosis diagnosis;

  const ReportToMail({
    @required this.room,
    @required this.name,
    @required this.title,
    @required this.description,
    @required this.diagnosis,
  });

  @override
  List<Object> get props => [
        this.room,
        this.name,
        this.title,
        this.description,
        this.diagnosis,
      ];
}
