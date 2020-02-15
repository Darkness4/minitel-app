import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart' show DebounceExtensions;
import 'package:minitel_toolbox/core/validators/validators.dart';

part 'report_status_event.dart';
part 'report_status_state.dart';

class ReportStatusBloc extends Bloc<ReportStatusEvent, ReportStatusState> {
  @override
  ReportStatusState get initialState => ReportStatusState.initial();

  @override
  Stream<ReportStatusState> transformEvents(
    Stream<ReportStatusEvent> events,
    Stream<ReportStatusState> Function(ReportStatusEvent event) next,
  ) {
    final debounceStream =
        events.debounceTime(const Duration(milliseconds: 300));

    return super.transformEvents(
      debounceStream,
      next,
    );
  }

  @override
  Stream<ReportStatusState> mapEventToState(
    ReportStatusEvent event,
  ) async* {
    if (event is NameChanged) {
      yield state.update(
        name: event.name,
        isValidName: event.name.isNotEmpty,
      );
    } else if (event is RoomChanged) {
      yield state.update(
        room: event.room,
        isValidRoom: event.room.isNotEmpty && event.room.containsOnlyNumbers,
      );
    } else if (event is DescriptionChanged) {
      yield state.update(description: event.description);
    } else if (event is TitleChanged) {
      yield state.update(
        title: event.title,
        isValidTitle: event.title.isNotEmpty,
      );
    }
  }
}
