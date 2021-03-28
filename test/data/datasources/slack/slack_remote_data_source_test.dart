import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:matcher/matcher.dart';
import 'package:minitel_toolbox/core/constants/api_keys.dart';
import 'package:minitel_toolbox/core/datetime/datetime_manager.dart';
import 'package:minitel_toolbox/data/datasources/slack/slack_remote_data_source.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'slack_remote_data_source_test.mocks.dart';

@GenerateMocks([http.Client, DateTimeManager])
void main() {
  late SlackRemoteDataSource dataSource;
  late MockClient mockHttpClient;
  late MockDateTimeManager mockDateTimeManager;

  setUp(() {
    mockHttpClient = MockClient();
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
        final tAttachments = <String, String>{
          'key1': 'value1',
          'key2': 'value2',
        };
        final tListAttachments = <Map<String, String>>[];
        tAttachments.forEach(
          (String key, String value) => tListAttachments.add(<String, String>{
            'fallback': key,
            'title': key,
            'text': value,
            'footer': 'Slack API',
          }),
        );
        const tText = 'test';
        final tDateTime = DateTime.now();
        const tChannel = 'T3ST';
        final tData = <String, dynamic>{
          'text': '*--Report $tDateTime--*\n'
              '$tText\n',
          'attachments': tListAttachments,
          'channel': tChannel,
        };
        when(mockDateTimeManager.now()).thenReturn(tDateTime);
        when(mockHttpClient.post(
          any,
          body: anyNamed('body'),
          headers: anyNamed('headers'),
        )).thenAnswer((_) async => http.Response('OK', 200));
        // act
        final result = await dataSource.report(
          tText,
          attachments: tAttachments,
          channel: tChannel,
        );
        // assert
        verify(mockHttpClient.post(
          Uri.parse('https://slack.com/api/chat.postMessage'),
          body: json.encode(tData),
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
            HttpHeaders.authorizationHeader: 'Bearer ${ApiKeys.webhook}',
          },
        ));
        expect(result, equals('OK'));
      },
    );
  });
}
