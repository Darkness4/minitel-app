import 'package:cubit/cubit.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:minitel_toolbox/core/validators/validators.dart';

part 'report_status_cubit.freezed.dart';
part 'report_status_state.dart';

@injectable
class ReportStatusCubit extends Cubit<ReportStatusState> {
  ReportStatusCubit() : super(ReportStatusState.initial());

  void descriptionChanged(String description) {
    emit(state.copyWith(description: description));
  }

  void nameChanged(String name) {
    emit(state.copyWith(
      name: name,
      isValidName: name.isNotEmpty,
    ));
  }

  void roomChanged(String room) {
    emit(state.copyWith(
      room: room,
      isValidRoom: room.isNotEmpty && room.containsOnlyNumbers,
    ));
  }

  void titleChanged(String title) {
    emit(state.copyWith(
      title: title,
      isValidTitle: title.isNotEmpty,
    ));
  }
}
