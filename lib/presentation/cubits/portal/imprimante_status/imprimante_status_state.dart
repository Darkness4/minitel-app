part of 'imprimante_status_cubit.dart';

@freezed
abstract class ImprimanteStatusState with _$ImprimanteStatusState {
  const factory ImprimanteStatusState.initial() = ImprimanteStatusInitial;
  const factory ImprimanteStatusState.loading() = ImprimanteStatusLoading;
  const factory ImprimanteStatusState.error(Exception e) =
      ImprimanteStatusError;
  const factory ImprimanteStatusState.loaded(bool success) =
      ImprimanteStatusLoaded;
}
