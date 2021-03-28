part of 'report_status_cubit.dart';

@freezed
class ReportStatusState with _$ReportStatusState {
  const factory ReportStatusState({
    required String name,
    required String room,
    required String title,
    required String description,
    required bool isValidName,
    required bool isValidTitle,
    required bool isValidRoom,
  }) = _ReportStatusState;

  factory ReportStatusState.initial() {
    return const ReportStatusState(
      description: '',
      name: '',
      room: '',
      title: '',
      isValidName: false,
      isValidRoom: false,
      isValidTitle: false,
    );
  }
}

extension ReportStatusStateX on ReportStatusState {
  bool get isValid => isValidName && isValidRoom && isValidTitle;
}
