/// Timezone field from icalendar
class Timezone {
  String tzid = "";
  TimezoneDescription daylight = TimezoneDescription();
  TimezoneDescription standard = TimezoneDescription();

  Timezone();
}

class TimezoneDescription {
  DateTime dtstart;
  String tzOffsetTo;
  String tzOffsetFrom;
  String rRule;
  String tzName;

  TimezoneDescription();

  TimezoneDescription.fromJson(Map<String, dynamic> json) {
    dtstart = DateTime.parse(json["DTSTART"]);
    tzOffsetTo = json["TZOFFSETTO"];
    tzOffsetFrom = json["TZOFFSETFROM"];
    rRule = json["RRULE"];
    tzName = json["TZNAME"];
  }

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
    }
  }
}
