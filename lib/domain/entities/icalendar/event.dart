import 'package:equatable/equatable.dart';

class Event extends Equatable {
  final DateTime dtend;
  final String uid;
  final DateTime dtstamp;
  final String location;
  final String description;
  final String summary;
  final DateTime dtstart;

  const Event({
    this.dtend,
    this.uid,
    this.dtstamp,
    this.location,
    this.description,
    this.summary,
    this.dtstart,
  });

  @override
  List<Object> get props => [
        this.dtend,
        this.uid,
        this.dtstamp,
        this.location,
        this.description,
        this.summary,
        this.dtstart,
      ];
}
