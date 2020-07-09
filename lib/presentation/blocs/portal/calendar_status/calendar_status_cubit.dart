import 'dart:async';

import 'package:cubit/cubit.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:minitel_toolbox/domain/repositories/calendar_url_repository.dart';

part 'calendar_status_cubit.freezed.dart';
part 'calendar_status_state.dart';

@injectable
class CalendarStatusCubit extends Cubit<CalendarStatusState> {
  final CalendarURLRepository calendarURLRepository;

  CalendarStatusCubit(this.calendarURLRepository)
      : super(const CalendarStatusInitial());

  Future<void> refresh() async {
    emit(CalendarStatusState.loading());
    try {
      final status = await calendarURLRepository.isSaved;
      emit(CalendarStatusState.loaded(status));
    } on Exception catch (e) {
      emit(CalendarStatusState.error(e));
    }
  }
}
