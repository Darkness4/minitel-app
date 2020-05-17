part of 'portal_status_bloc.dart';

@freezed
abstract class PortalStatusState with _$PortalStatusState {
  const factory PortalStatusState({
    @required bool calendarIsSuccess,
    @required bool portalIsSuccess,
    @required bool printerIsSuccess,
    @required String stormshieldState,
    @required bool stormshieldIsSuccess,
    @required bool isFetching,
    @required bool isFailure,
    Exception error,
  }) = _PortalStatusState;

  static PortalStatusState empty() {
    return const PortalStatusState(
      calendarIsSuccess: false,
      portalIsSuccess: false,
      printerIsSuccess: false,
      stormshieldState: "Not logged in.",
      stormshieldIsSuccess: false,
      isFetching: false,
      isFailure: false,
      error: null,
    );
  }

  static PortalStatusState loading() {
    return const PortalStatusState(
      calendarIsSuccess: false,
      portalIsSuccess: false,
      printerIsSuccess: false,
      stormshieldState: "Loading",
      stormshieldIsSuccess: false,
      isFetching: true,
      isFailure: false,
      error: null,
    );
  }
}

extension PortalStatusStateX on PortalStatusState {
  PortalStatusState update({
    bool calendarIsSuccess,
    bool portalIsSuccess,
    bool printerIsSuccess,
    String stormshieldState,
    bool stormshieldIsSuccess,
    bool isFailure,
    Exception error,
  }) {
    return copyWith(
      calendarIsSuccess: calendarIsSuccess ?? this.calendarIsSuccess,
      portalIsSuccess: portalIsSuccess ?? this.portalIsSuccess,
      printerIsSuccess: printerIsSuccess ?? this.printerIsSuccess,
      stormshieldState: stormshieldState ?? this.stormshieldState,
      stormshieldIsSuccess: stormshieldIsSuccess ?? this.stormshieldIsSuccess,
      isFetching: false,
      isFailure: isFailure ?? this.isFailure,
      error: error,
    );
  }
}
