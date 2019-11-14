part of 'portal_login_bloc.dart';

class PortalLoginState extends Equatable {
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;
  final dynamic error;

  const PortalLoginState({
    @required this.isSubmitting,
    @required this.isSuccess,
    @required this.isFailure,
    this.error,
  });

  factory PortalLoginState.empty() {
    return const PortalLoginState(
      isSubmitting: false,
      isSuccess: false,
      isFailure: false,
    );
  }

  factory PortalLoginState.failure(dynamic error) {
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

  @override
  List<Object> get props => [
        this.isSubmitting,
        this.isSuccess,
        this.isFailure,
        this.error,
      ];

  PortalLoginState copyWith({
    bool isSubmitting,
    bool isSuccess,
    bool isFailure,
    dynamic error,
  }) {
    return PortalLoginState(
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
      error: error ?? this.error,
    );
  }

  @override
  String toString() {
    return """{
  isSubmitting: $isSubmitting,
  isSuccess: $isSuccess,
  isFailure: $isFailure,
  error: $error,
}""";
  }
}
