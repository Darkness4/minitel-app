part of 'portail_emse_status_cubit.dart';

@freezed
abstract class PortailEmseStatusState with _$PortailEmseStatusState {
  const factory PortailEmseStatusState.initial() = PortailEmseStatusInitial;
  const factory PortailEmseStatusState.loading() = PortailEmseStatusLoading;
  const factory PortailEmseStatusState.error(Exception e) =
      PortailEmseStatusError;
  const factory PortailEmseStatusState.loaded(bool status) =
      PortailEmseStatusLoaded;
}
