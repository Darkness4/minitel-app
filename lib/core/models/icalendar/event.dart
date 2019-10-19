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
