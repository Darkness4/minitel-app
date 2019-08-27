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

  factory Event.fromJson(Map<String, dynamic> json) {
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json["DTEND"] = dtend.toIso8601String();
    json["UID"] = uid;
    json["DTSTAMP"] = dtstamp.toIso8601String();
    json["LOCATION"] = location;
    json["DESCRIPTION"] = description;
    json["SUMMARY"] = summary;
    json["DTSTART"] = dtstart.toIso8601String();

    return json;
  }
}
