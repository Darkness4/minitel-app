class Event {
  DateTime dtend;
  String uid;
  DateTime dtstamp;
  String location;
  String description;
  String summary;
  DateTime dtstart;

  Event.fromJson(Map<String, dynamic> json) {
    dtend = DateTime.parse(json["DTEND"]);
    uid = json["UID"];
    dtstamp = DateTime.parse(json["DTSTAMP"]);
    location = json["LOCATION"];
    description = json["DESCRIPTION"];
    summary = json["SUMMARY"];
    dtstart = DateTime.parse(json["DTSTART"]);
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
