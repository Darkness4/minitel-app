import 'package:minitel_toolbox/domain/entities/icalendar/event.dart';

class EventModel extends Event {
  const EventModel({
    DateTime dtend,
    String uid,
    DateTime dtstamp,
    String location,
    String description,
    String summary,
    DateTime dtstart,
  }) : super(
          dtend: dtend,
          uid: uid,
          dtstamp: dtstamp,
          location: location,
          description: description,
          summary: summary,
          dtstart: dtstart,
        );

  factory EventModel.fromMap(Map<String, dynamic> json) {
    return EventModel(
      dtend: DateTime.parse(json["DTEND"] as String),
      uid: json["UID"] as String,
      dtstamp: DateTime.parse(json["DTSTAMP"] as String),
      location: json["LOCATION"] as String,
      description: json["DESCRIPTION"] as String,
      summary: json["SUMMARY"] as String,
      dtstart: DateTime.parse(json["DTSTART"] as String),
    );
  }
}
