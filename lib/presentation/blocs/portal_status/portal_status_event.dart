part of 'portal_status_bloc.dart';

class CalendarStatusChanged extends PortalStatusEvent {
  final bool calendarIsSuccess;

  CalendarStatusChanged({@required this.calendarIsSuccess});

  @override
  List<Object> get props => [calendarIsSuccess];
}

class PortalStatusChanged extends PortalStatusEvent {
  final bool portalIsSuccess;

  PortalStatusChanged({@required this.portalIsSuccess});

  @override
  List<Object> get props => [portalIsSuccess];
}

abstract class PortalStatusEvent extends Equatable {
  @override
  List<Object> get props => [];

  @override
  bool get stringify => true;
}

class PortalStatusFailureEvent extends PortalStatusEvent {
  final dynamic error;

  PortalStatusFailureEvent({@required this.error});

  @override
  List<Object> get props => [error];
}

class PrinterStatusChanged extends PortalStatusEvent {
  final bool printerIsSuccess;

  PrinterStatusChanged({@required this.printerIsSuccess});

  @override
  List<Object> get props => [printerIsSuccess];
}

class RefreshEvent extends PortalStatusEvent {
  final String selectedUrl;

  RefreshEvent(this.selectedUrl);

  @override
  List<Object> get props => [selectedUrl];
}

class StormshieldStatusChanged extends PortalStatusEvent {
  final String stormshieldState;
  final bool stormshieldIsSuccess;

  StormshieldStatusChanged({
    @required this.stormshieldState,
    @required this.stormshieldIsSuccess,
  });

  @override
  List<Object> get props => [
        stormshieldState,
        stormshieldIsSuccess,
      ];
}
