import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:matcher/matcher.dart';
import 'package:minitel_toolbox/core/constants/api_keys.dart';
import 'package:minitel_toolbox/core/constants/datetime/datetime_manager.dart';
import 'package:minitel_toolbox/data/datasources/slack/slack_remote_data_source.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

void main() {
  SlackRemoteDataSource dataSource;
  MockHttpClient mockHttpClient;
  MockDateTimeManager mockDateTimeManager;

  setUp(() {
    mockHttpClient = MockHttpClient();
    mockDateTimeManager = MockDateTimeManager();
    dataSource = SlackRemoteDataSourceImpl(
      client: mockHttpClient,
      dateTimeManager: mockDateTimeManager,
    );
  });

  group('report', () {
    test(
      'should execute',
      () async {
        // arrange
        final Map<String, String> tAttachments = <String, String>{
          "key1": "value1",
          "key2": "value2",
        };
        final tListAttachments = <Map<String, String>>[];
        tAttachments.forEach(
          (String key, String value) => tListAttachments.add(<String, String>{
            "fallback": key,
            "title": key,
            "text": value,
            "footer": "Slack API",
          }),
        );
        const tText = "test";
        final tDateTime = DateTime.now();
        const tChannel = "T3ST";
        final Map<String, dynamic> tData = <String, dynamic>{
          'text': "*--Report ${tDateTime}--*\n"
              "$tText\n",
          "attachments": tListAttachments,
          'channel': tChannel, // Marc : DE8PA0Z1C
        };
        when(mockDateTimeManager.now()).thenReturn(tDateTime);
        when(mockHttpClient.post(
          any,
          body: anyNamed('body'),
          headers: anyNamed('headers'),
        )).thenAnswer((_) async => http.Response("OK", 200));
        // act
        final result = await dataSource.report(
          tText,
          attachments: tAttachments,
          channel: tChannel,
        );
        // assert
        verify(mockHttpClient.post(
          "https://slack.com/api/chat.postMessage",
          body: json.encode(tData),
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
            HttpHeaders.authorizationHeader: "Bearer ${ApiKeys.zabbixToken}",
          },
        ));
        expect(result, equals("OK"));
      },
    );
  });
}

class MockHttpClient extends Mock implements http.Client {}

class MockDateTimeManager extends Mock implements DateTimeManager {}
