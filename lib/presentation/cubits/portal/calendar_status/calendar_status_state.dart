part of 'calendar_status_cubit.dart';

@freezed
abstract class CalendarStatusState with _$CalendarStatusState {
  const factory CalendarStatusState.initial() = CalendarStatusInitial;
  const factory CalendarStatusState.loading() = CalendarStatusLoading;
  const factory CalendarStatusState.error(Exception e) = CalendarStatusError;
  const factory CalendarStatusState.loaded(bool status) = CalendarStatusLoaded;
}
