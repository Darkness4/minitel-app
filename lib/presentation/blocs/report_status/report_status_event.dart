part of 'report_status_bloc.dart';

@freezed
abstract class ReportStatusEvent with _$ReportStatusEvent {
  const factory ReportStatusEvent.nameChanged(String name) = NameChanged;
  const factory ReportStatusEvent.roomChanged(String room) = RoomChanged;
  const factory ReportStatusEvent.titleChanged(String title) = TitleChanged;
  const factory ReportStatusEvent.descriptionChanged(String description) =
      DescriptionChanged;
}
