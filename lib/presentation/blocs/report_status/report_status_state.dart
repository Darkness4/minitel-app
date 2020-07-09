part of 'report_status_bloc.dart';

@freezed
abstract class ReportStatusState with _$ReportStatusState {
  const factory ReportStatusState({
    @required @nullable String name,
    @required @nullable String room,
    @required @nullable String title,
    @required @nullable String description,
    @required bool isValidName,
    @required bool isValidTitle,
    @required bool isValidRoom,
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
