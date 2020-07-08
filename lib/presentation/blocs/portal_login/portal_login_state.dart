part of 'portal_login_bloc.dart';

@freezed
abstract class PortalLoginState with _$PortalLoginState {
  const factory PortalLoginState({
    @required bool isSubmitting,
    @required bool isSuccess,
    @required bool isFailure,
    Exception error,
  }) = _PortalLoginState;

  factory PortalLoginState.empty() {
    return const PortalLoginState(
      isSubmitting: false,
      isSuccess: false,
      isFailure: false,
    );
  }

  factory PortalLoginState.failure(Exception error) {
    return PortalLoginState(
      isSubmitting: false,
      isSuccess: false,
      isFailure: true,
      error: error,
    );
  }

  factory PortalLoginState.loading() {
    return const PortalLoginState(
      isSubmitting: true,
      isSuccess: false,
      isFailure: false,
    );
  }

  factory PortalLoginState.success() {
    return const PortalLoginState(
      isSubmitting: false,
      isSuccess: true,
      isFailure: false,
    );
  }
}
