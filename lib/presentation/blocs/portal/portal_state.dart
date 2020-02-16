part of 'portal_bloc.dart';

class PortalState extends Equatable {
  final bool rememberMe;
  final bool autoLogin;
  final String uid;
  final String selectedTime;
  final String selectedUrl;
  final String pswd;

  final bool isValidUid;

  final bool isLoaded;
  final bool isLoading;
  final bool isError;

  const PortalState({
    @required this.rememberMe,
    @required this.autoLogin,
    @required this.uid,
    @required this.selectedTime,
    @required this.selectedUrl,
    @required this.pswd,
    @required this.isError,
    @required this.isLoading,
    @required this.isLoaded,
    @required this.isValidUid,
  });

  @override
  bool get stringify => true;

  factory PortalState.failure() {
    return const PortalState(
      rememberMe: false,
      autoLogin: false,
      uid: "",
      selectedTime: '4 hours',
      selectedUrl: MyIPAdresses.stormshieldIP,
      pswd: "",
      isError: true,
      isLoading: false,
      isLoaded: false,
      isValidUid: false,
    );
  }

  factory PortalState.initial() {
    return const PortalState(
      rememberMe: false,
      autoLogin: false,
      uid: "",
      selectedTime: '4 hours',
      selectedUrl: MyIPAdresses.stormshieldIP,
      pswd: "",
      isError: false,
      isLoading: false,
      isLoaded: false,
      isValidUid: false,
    );
  }

  factory PortalState.loading() {
    return const PortalState(
      rememberMe: false,
      autoLogin: false,
      uid: "",
      selectedTime: '4 hours',
      selectedUrl: MyIPAdresses.stormshieldIP,
      pswd: "",
      isError: false,
      isLoading: true,
      isLoaded: false,
      isValidUid: true,
    );
  }

  @override
  List<Object> get props => [
        this.rememberMe,
        this.autoLogin,
        this.uid,
        this.selectedTime,
        this.selectedUrl,
        this.pswd,
        this.isError,
        this.isLoading,
        this.isLoaded,
        this.isValidUid,
      ];

  PortalState copyWith({
    bool rememberMe,
    bool autoLogin,
    String uid,
    String selectedTime,
    String selectedUrl,
    String pswd,
    bool isError,
    bool isLoading,
    bool isLoaded,
    bool isValidUid,
  }) {
    return PortalState(
      rememberMe: rememberMe ?? this.rememberMe,
      autoLogin: autoLogin ?? this.autoLogin,
      uid: uid ?? this.uid,
      selectedTime: selectedTime ?? this.selectedTime,
      selectedUrl: selectedUrl ?? this.selectedUrl,
      pswd: pswd ?? this.pswd,
      isError: isError ?? this.isError,
      isLoading: isLoading ?? this.isLoading,
      isLoaded: isLoaded ?? false,
      isValidUid: isValidUid ?? this.isValidUid,
    );
  }

  PortalState update({
    bool rememberMe,
    bool autoLogin,
    String uid,
    String selectedTime,
    String selectedUrl,
    String pswd,
    bool isLoaded,
    bool isValidUid,
  }) {
    return copyWith(
      rememberMe: rememberMe,
      autoLogin: autoLogin,
      uid: uid,
      selectedTime: selectedTime,
      selectedUrl: selectedUrl,
      pswd: pswd,
      isError: false,
      isLoading: false,
      isLoaded: isLoaded,
      isValidUid: isValidUid,
    );
  }
}
