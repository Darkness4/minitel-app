part of 'portal_status_bloc.dart';

@immutable
class PortalStatusState extends Equatable {
  final bool calendarIsSuccess;
  final bool portalIsSuccess;
  final bool printerIsSuccess;
  final String stormshieldState;
  final bool stormshieldIsSuccess;

  final bool isFetching;
  final bool isFailure;
  final dynamic error;

  const PortalStatusState({
    @required this.calendarIsSuccess,
    @required this.portalIsSuccess,
    @required this.printerIsSuccess,
    @required this.stormshieldState,
    @required this.stormshieldIsSuccess,
    @required this.isFetching,
    @required this.isFailure,
    @required this.error,
  });

  @override
  bool get stringify => true;

  factory PortalStatusState.empty() {
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

  factory PortalStatusState.loading() {
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

  @override
  List<Object> get props => [
        this.calendarIsSuccess,
        this.portalIsSuccess,
        this.printerIsSuccess,
        this.stormshieldState,
        this.stormshieldIsSuccess,
        this.isFetching,
        this.isFailure,
        this.error,
      ];

  PortalStatusState copyWith({
    bool calendarIsSuccess,
    bool portalIsSuccess,
    bool printerIsSuccess,
    String stormshieldState,
    bool stormshieldIsSuccess,
    bool isFetching,
    bool isFailure,
    dynamic error,
  }) {
    return PortalStatusState(
      calendarIsSuccess: calendarIsSuccess ?? this.calendarIsSuccess,
      portalIsSuccess: portalIsSuccess ?? this.portalIsSuccess,
      printerIsSuccess: printerIsSuccess ?? this.printerIsSuccess,
      stormshieldState: stormshieldState ?? this.stormshieldState,
      stormshieldIsSuccess: stormshieldIsSuccess ?? this.stormshieldIsSuccess,
      isFetching: isFetching ?? this.isFetching,
      isFailure: isFailure ?? this.isFailure,
      error: error ?? this.error,
    );
  }

  PortalStatusState update({
    bool calendarIsSuccess,
    bool portalIsSuccess,
    bool printerIsSuccess,
    String stormshieldState,
    bool stormshieldIsSuccess,
    bool isFailure,
    dynamic error,
  }) {
    return copyWith(
      calendarIsSuccess: calendarIsSuccess,
      portalIsSuccess: portalIsSuccess,
      printerIsSuccess: printerIsSuccess,
      stormshieldState: stormshieldState,
      stormshieldIsSuccess: stormshieldIsSuccess,
      isFetching: false,
      isFailure: isFailure,
      error: error,
    );
  }
}
