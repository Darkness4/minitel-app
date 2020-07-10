part of 'agenda_cubit.dart';

@freezed
abstract class AgendaState with _$AgendaState {
  const factory AgendaState.initial() = AgendaInitial;
  const factory AgendaState.loading() = AgendaLoading;
  const factory AgendaState.error(Exception exception) = AgendaError;
  const factory AgendaState.loaded(List<Event> events) = AgendaLoaded;
}
