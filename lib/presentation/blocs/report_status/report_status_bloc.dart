import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:minitel_toolbox/core/validators/validators.dart';
import 'package:rxdart/rxdart.dart' show DebounceExtensions;

part 'report_status_event.dart';
part 'report_status_state.dart';

class ReportStatusBloc extends Bloc<ReportStatusEvent, ReportStatusState> {
  @override
  ReportStatusState get initialState => ReportStatusState.initial();

  @override
  Stream<ReportStatusState> mapEventToState(
    ReportStatusEvent event,
  ) async* {
    if (event is NameChanged) {
      yield* _mapNameChangedToState(event);
    } else if (event is RoomChanged) {
      yield* _mapRoomChangedToState(event);
    } else if (event is DescriptionChanged) {
      yield* _mapDescriptionChangedToState(event);
    } else if (event is TitleChanged) {
      yield* _mapTitleChangedToState(event);
    }
  }

  @override
  Stream<Transition<ReportStatusEvent, ReportStatusState>> transformEvents(
    Stream<ReportStatusEvent> events,
    Stream<Transition<ReportStatusEvent, ReportStatusState>> Function(
            ReportStatusEvent)
        transitionFn,
  ) {
    final debounceStream =
        events.debounceTime(const Duration(milliseconds: 300));

    return super.transformEvents(debounceStream, transitionFn);
  }

  Stream<ReportStatusState> _mapDescriptionChangedToState(
      DescriptionChanged event) async* {
    yield state.update(description: event.description);
  }

  Stream<ReportStatusState> _mapNameChangedToState(NameChanged event) async* {
    yield state.update(
      name: event.name,
      isValidName: event.name.isNotEmpty,
    );
  }

  Stream<ReportStatusState> _mapRoomChangedToState(RoomChanged event) async* {
    yield state.update(
      room: event.room,
      isValidRoom: event.room.isNotEmpty && event.room.containsOnlyNumbers,
    );
  }

  Stream<ReportStatusState> _mapTitleChangedToState(TitleChanged event) async* {
    yield state.update(
      title: event.title,
      isValidTitle: event.title.isNotEmpty,
    );
  }
}
