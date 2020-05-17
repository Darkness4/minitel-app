part of 'portal_status_bloc.dart';

@freezed
abstract class PortalStatusEvent with _$PortalStatusEvent {
  const factory PortalStatusEvent.calendarStatusChanged(
      bool calendarIsSuccess) = CalendarStatusChanged;
  const factory PortalStatusEvent.portalStatusChanged(bool portalIsSuccess) =
      PortalStatusChanged;
  const factory PortalStatusEvent.failure(Exception error) =
      PortalStatusFailureEvent;
  const factory PortalStatusEvent.printerStatusChanged(bool printerIsSuccess) =
      PrinterStatusChanged;
  const factory PortalStatusEvent.refresh(String selectedUrl) = RefreshEvent;
  const factory PortalStatusEvent.stormshieldStatusChanged({
    @required String stormshieldState,
    @required bool stormshieldIsSuccess,
  }) = StormshieldStatusChanged;
}
