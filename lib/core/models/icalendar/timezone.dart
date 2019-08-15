/// Timezone field from icalendar
class Timezone {
  String tzid = "";
  TimezoneDescription daylight = TimezoneDescription();
  TimezoneDescription standard = TimezoneDescription();

  Timezone();

  Timezone.fromJson(Map<String, dynamic> json) {
    tzid = json['TZID'];
    daylight = TimezoneDescription.fromJson(json['DAYLIGHT']);
    standard = TimezoneDescription.fromJson(json['STANDARD']);
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['TZID'] = tzid;
    json['DAYLIGHT'] = daylight.toJson();
    json['STANDARD'] = standard.toJson();
    return json;
  }
}

class TimezoneDescription {
  DateTime dtstart;
  String tzOffsetTo;
  String tzOffsetFrom;
  String rRule;
  String tzName;

  void set(String key, String value) {
    switch (key) {
      case "DTSTART":
        dtstart = DateTime.parse(value);
        break;
      case "TZOFFSETTO":
        tzOffsetTo = value;
        break;
      case "TZOFFSETFROM":
        tzOffsetFrom = value;
        break;
      case "RRULE":
        rRule = value;
        break;
      case "TZNAME":
        tzName = value;
        break;
      default:
        print("Invalid key: $key");
    }
  }

  TimezoneDescription();

  TimezoneDescription.fromJson(Map<String, dynamic> json) {
    dtstart = DateTime.parse(json["DTSTART"]);
    tzOffsetTo = json["TZOFFSETTO"];
    tzOffsetFrom = json["TZOFFSETFROM"];
    rRule = json["RRULE"];
    tzName = json["TZNAME"];
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json["DTSTART"] = dtstart.toIso8601String();
    json["TZOFFSETTO"] = tzOffsetTo;
    json["TZOFFSETFROM"] = tzOffsetFrom;
    json["RRULE"] = rRule;
    json["TZNAME"] = tzName;

    return json;
  }
}
