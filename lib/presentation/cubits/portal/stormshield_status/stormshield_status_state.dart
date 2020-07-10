part of 'stormshield_status_cubit.dart';

@freezed
abstract class StormshieldStatusState with _$StormshieldStatusState {
  const factory StormshieldStatusState.initial() = StormshieldStatusInitial;
  const factory StormshieldStatusState.loading() = StormshieldStatusLoading;
  const factory StormshieldStatusState.error(Exception e) =
      StormshieldStatusError;
  const factory StormshieldStatusState.loaded(String status) =
      StormshieldStatusLoaded;
}
