import 'event.dart';
import 'timezone.dart';

/// Parsed calendar generated by [parseCalendar]
class ParsedCalendar {
  String version = "";
  String prodID = "";
  String calscale = "";

  /// Timezone standard and daylight
  Timezone timezone = Timezone();

  List<Event> events = <Event>[];

  ParsedCalendar();

  ParsedCalendar.fromJson(Map<String, dynamic> json) {
    version = json['VERSION'];
    prodID = json['PRODID'];
    calscale = json['CALSCALE'];
    final List<Map<String, dynamic>> data =
        List<Map<String, dynamic>>.from(json["VEVENT"]);
    events = data
        .map((Map<String, dynamic> event) => Event.fromJson(event))
        .toList();
    timezone = Timezone.fromJson(json['VTIMEZONE']);
  }

  void set(String key, String value) {
    switch (key) {
      case "VERSION":
        version = value;
        break;
      case "PRODID":
        prodID = value;
        break;
      case "CALSCALE":
        calscale = value;
        break;
      default:
        print("Invalid key: $key");
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['VERSION'] = version;
    json['PRODID'] = prodID;
    json['CALSCALE'] = calscale;
    json['VEVENT'] = events.map((Event event) => event.toJson()).toList();
    json['VTIMEZONE'] = timezone.toJson();
    return json;
  }
}