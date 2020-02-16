part of 'report_status_bloc.dart';

class ReportStatusState extends Equatable {
  final String name;
  final String room;
  final String title;
  final String description;

  final bool isValidName;
  final bool isValidTitle;
  final bool isValidRoom;

  const ReportStatusState({
    @required this.name,
    @required this.room,
    @required this.title,
    @required this.description,
    @required this.isValidName,
    @required this.isValidRoom,
    @required this.isValidTitle,
  });

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [
        this.name,
        this.room,
        this.title,
        this.description,
        this.isValidName,
        this.isValidRoom,
        this.isValidTitle,
      ];

  factory ReportStatusState.initial() {
    return const ReportStatusState(
      description: "",
      name: "",
      room: "",
      title: "",
      isValidName: false,
      isValidRoom: false,
      isValidTitle: false,
    );
  }

  ReportStatusState copyWith({
    String name,
    String room,
    String title,
    String description,
    bool isValidTitle,
    bool isValidName,
    bool isValidRoom,
  }) {
    return ReportStatusState(
      name: name ?? this.name,
      room: room ?? this.room,
      title: title ?? this.title,
      description: description ?? this.description,
      isValidName: isValidName ?? this.isValidName,
      isValidRoom: isValidRoom ?? this.isValidRoom,
      isValidTitle: isValidTitle ?? this.isValidTitle,
    );
  }

  ReportStatusState update({
    String name,
    String room,
    String title,
    String description,
    bool isValidTitle,
    bool isValidName,
    bool isValidRoom,
  }) {
    return copyWith(
      name: name,
      room: room,
      title: title,
      description: description,
      isValidName: isValidName,
      isValidRoom: isValidRoom,
      isValidTitle: isValidTitle,
    );
  }

  bool get isValid => isValidName && isValidRoom && isValidTitle;
}
