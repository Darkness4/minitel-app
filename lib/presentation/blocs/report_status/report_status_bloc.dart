import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:minitel_toolbox/core/validators/validators.dart';
import 'package:rxdart/rxdart.dart' show DebounceExtensions;

part 'report_status_bloc.freezed.dart';
part 'report_status_event.dart';
part 'report_status_state.dart';

@injectable
class ReportStatusBloc extends Bloc<ReportStatusEvent, ReportStatusState> {
  ReportStatusBloc() : super(ReportStatusState.initial());

  @override
  Stream<ReportStatusState> mapEventToState(
    ReportStatusEvent event,
  ) {
    return event.map(
      nameChanged: _mapNameChangedToState,
      roomChanged: _mapRoomChangedToState,
      titleChanged: _mapTitleChangedToState,
      descriptionChanged: _mapDescriptionChangedToState,
    );
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
    yield state.copyWith(description: event.description);
  }

  Stream<ReportStatusState> _mapNameChangedToState(NameChanged event) async* {
    yield state.copyWith(
      name: event.name,
      isValidName: event.name.isNotEmpty,
    );
  }

  Stream<ReportStatusState> _mapRoomChangedToState(RoomChanged event) async* {
    yield state.copyWith(
      room: event.room,
      isValidRoom: event.room.isNotEmpty && event.room.containsOnlyNumbers,
    );
  }

  Stream<ReportStatusState> _mapTitleChangedToState(TitleChanged event) async* {
    yield state.copyWith(
      title: event.title,
      isValidTitle: event.title.isNotEmpty,
    );
  }
}
