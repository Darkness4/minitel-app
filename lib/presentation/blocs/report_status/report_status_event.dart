part of 'report_status_bloc.dart';

abstract class ReportStatusEvent extends Equatable {
  const ReportStatusEvent();

  @override
  bool get stringify => true;
}

class NameChanged extends ReportStatusEvent {
  final String name;

  const NameChanged({@required this.name});

  @override
  List<Object> get props => [name];
}

class RoomChanged extends ReportStatusEvent {
  final String room;

  const RoomChanged({@required this.room});

  @override
  List<Object> get props => [room];
}

class TitleChanged extends ReportStatusEvent {
  final String title;

  const TitleChanged({@required this.title});

  @override
  List<Object> get props => [title];
}

class DescriptionChanged extends ReportStatusEvent {
  final String description;

  const DescriptionChanged({@required this.description});

  @override
  List<Object> get props => [description];
}
