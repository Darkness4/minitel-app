part of 'agenda_bloc.dart';

abstract class AgendaState extends Equatable {
  const AgendaState();
}

class AgendaInitial extends AgendaState {
  const AgendaInitial();

  @override
  List<Object> get props => [];
}

class AgendaLoading extends AgendaState {
  const AgendaLoading();

  @override
  List<Object> get props => [];
}

class AgendaError extends AgendaState {
  final dynamic error;

  const AgendaError(this.error);

  @override
  List<Object> get props => [];
}

class AgendaLoaded extends AgendaState {
  final Stream<Event> events;

  const AgendaLoaded({@required this.events});

  @override
  List<Object> get props => [];
}
