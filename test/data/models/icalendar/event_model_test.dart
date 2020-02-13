import 'package:flutter_test/flutter_test.dart';
import 'package:minitel_toolbox/data/models/icalendar/event_model.dart';
import 'package:minitel_toolbox/domain/entities/icalendar/event.dart';

void main() {
  final tEventModel = EventModel(
    dtend: DateTime.parse("20200127T100000"),
    dtstamp: DateTime.parse("20200127T100000"),
    description: "description",
    dtstart: DateTime.parse("20200127T100000"),
    location: "Location",
    summary: "Summary",
    uid: "Uid",
  );

  group('fromMap', () {
    test(
      'should return a valid model',
      () async {
        // arrange
        final Map<String, dynamic> jsonMap = <String, dynamic>{
          "DTEND": "20200127T100000",
          "UID": "Uid",
          "DTSTAMP": "20200127T100000",
          "LOCATION": "Location",
          "DESCRIPTION": "description",
          "SUMMARY": "Summary",
          "DTSTART": "20200127T100000",
        };
        // act
        final result = EventModel.fromMap(jsonMap);
        // assert
        expect(result, tEventModel);
      },
    );
  });
  test(
    'should be a subclass of an entity',
    () async {
      // assert
      expect(tEventModel, isA<Event>());
    },
  );
}
