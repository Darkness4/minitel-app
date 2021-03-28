import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:matcher/matcher.dart';
import 'package:minitel_toolbox/core/constants/api_keys.dart';
import 'package:minitel_toolbox/core/error/exceptions.dart';
import 'package:minitel_toolbox/data/datasources/zabbix/zabbix_remote_data_source.dart';
import 'package:minitel_toolbox/domain/entities/zabbix/zabbix_host.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../fixtures/fixture_reader.dart';
import 'zabbix_remote_data_source_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  late ZabbixRemoteDataSource dataSource;
  late MockClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockClient();
    dataSource = ZabbixRemoteDataSourceImpl(clientNoCheck: mockHttpClient);
  });

  void setUpMockHttpClientSuccess200() {
    when(mockHttpClient.post(
      argThat(startsWith('${ApiKeys.zabbixPath}/api_jsonrpc.php')),
      body: anyNamed('body'),
      headers: anyNamed('headers'),
    )).thenAnswer((_) async => http.Response(
          fixture('datasources/zabbix_remote_data_source/ap_response.json'),
          200,
          headers: Map<String, String>.from(json.decode(fixture(
                  'datasources/zabbix_remote_data_source/ap_header.json'))
              as Map<String, dynamic>),
        ));
  }

  void setUpMockHttpClientFailure404() {
    when(
      mockHttpClient.post(
        any,
        body: anyNamed('body'),
        headers: anyNamed('headers'),
      ),
    ).thenAnswer((_) async => http.Response('Something went wrong', 404));
  }

  void setUpMockHttpClientTimedOut() {
    when(
      mockHttpClient.post(
        any,
        body: anyNamed('body'),
        headers: anyNamed('headers'),
      ),
    ).thenAnswer(
      (_) async =>
          throw const SocketException('OS Error: Connection timed out'),
    );
  }

  void setUpMockHttpClientNoRouteToHost() {
    when(
      mockHttpClient.post(
        any,
        body: anyNamed('body'),
        headers: anyNamed('headers'),
      ),
    ).thenAnswer(
      (_) async => throw const SocketException('OS Error: No route to host'),
    );
  }

  void setUpMockHttpClientSocketException() {
    when(
      mockHttpClient.post(
        any,
        body: anyNamed('body'),
        headers: anyNamed('headers'),
      ),
    ).thenAnswer(
      (_) async => throw const SocketException('Something went wrong.'),
    );
  }

  group('fetchZabbixHosts', () {
    // arrange
    const tGroupIds = 17;
    final tData = <String, dynamic>{
      'jsonrpc': '2.0',
      'method': 'host.get',
      'params': <String, dynamic>{
        'groupids': tGroupIds,
        'output': <String>[
          'host',
        ],
        'selectItems': <String>[
          'type',
          'value_type',
          'name',
          'lastvalue',
          'units',
          'snmp_oid',
        ],
        'selectInterfaces': <String>[
          'ip',
        ],
      },
      'id': 2,
      'auth': ApiKeys.zabbixToken,
    };

    final tBody = json.decode(
            fixture('datasources/zabbix_remote_data_source/ap_response.json'))
        as Map<String, dynamic>;
    final tListZabbixHostModel = (tBody['result'] as List<dynamic>)
        .map<ZabbixHost>(
            (dynamic host) => ZabbixHost.fromJson(host as Map<String, dynamic>))
        .toList();
    test(
      'should perform a GET request',
      () async {
        // arrange
        setUpMockHttpClientSuccess200();
        final tDataEncoded = json.encode(tData);
        // act
        await dataSource.fetchZabbixHosts(tGroupIds);
        // assert
        verify(mockHttpClient.post(
          Uri.parse('${ApiKeys.zabbixPath}/api_jsonrpc.php'),
          headers: {'Content-Type': 'application/json-rpc'},
          body: tDataEncoded,
        ));
      },
    );

    test(
      'should return ListZabbixHostModel when the response code is 200 (success)',
      () async {
        // arrange
        setUpMockHttpClientSuccess200();
        // act
        final result = await dataSource.fetchZabbixHosts(tGroupIds);

        // assert
        expect(result, equals(tListZabbixHostModel));
      },
    );

    test(
      'should throw a ServerException when the response code is 404 or other',
      () async {
        // arrange
        setUpMockHttpClientFailure404();
        // act
        final call = dataSource.fetchZabbixHosts;
        // assert
        expect(() => call(tGroupIds), throwsA(isA<ServerException>()));
      },
    );

    test(
      'should throw a ClientException when SocketException',
      () async {
        // arrange
        setUpMockHttpClientSocketException();
        // act
        final call = dataSource.fetchZabbixHosts;
        // assert
        expect(() => call(tGroupIds), throwsA(isA<ClientException>()));
      },
    );

    test(
      'should throw a ClientException when No route to host',
      () async {
        // arrange
        setUpMockHttpClientNoRouteToHost();
        // act
        final call = dataSource.fetchZabbixHosts;
        // assert
        expect(() => call(tGroupIds), throwsA(isA<ClientException>()));
      },
    );

    test(
      'should throw a ClientException when Timed out',
      () async {
        // arrange
        setUpMockHttpClientTimedOut();
        // act
        final call = dataSource.fetchZabbixHosts;
        // assert
        expect(() => call(tGroupIds), throwsA(isA<ClientException>()));
      },
    );
  });
}
