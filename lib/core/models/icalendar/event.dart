class Event {
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

  factory Event.fromMap(Map<String, dynamic> json) {
    return Event(
      dtend: DateTime.parse(json["DTEND"]),
      uid: json["UID"],
      dtstamp: DateTime.parse(json["DTSTAMP"]),
      location: json["LOCATION"],
      description: json["DESCRIPTION"],
      summary: json["SUMMARY"],
      dtstart: DateTime.parse(json["DTSTART"]),
    );
  }
}
