import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:matcher/matcher.dart';
import 'package:minitel_toolbox/core/constants/api_keys.dart';
import 'package:minitel_toolbox/core/error/exceptions.dart';
import 'package:minitel_toolbox/data/datasources/zabbix/zabbix_remote_data_source.dart';
import 'package:minitel_toolbox/data/models/zabbix/zabbix_host_model.dart';
import 'package:mockito/mockito.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  ZabbixRemoteDataSource dataSource;
  MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
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
          throw const SocketException("OS Error: Connection timed out"),
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
      (_) async => throw const SocketException("OS Error: No route to host"),
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
      (_) async => throw const SocketException("Something went wrong."),
    );
  }

  group('fetchZabbixHosts', () {
    // arrange
    const tGroupIds = 17;
    final Map<String, Object> tData = <String, dynamic>{
      "jsonrpc": "2.0",
      "method": "host.get",
      "params": <String, dynamic>{
        "groupids": tGroupIds,
        "output": <String>[
          "host",
        ],
        "selectItems": <String>[
          'type',
          'value_type',
          'name',
          'lastvalue',
          'units',
          'snmp_oid',
        ],
        "selectInterfaces": <String>[
          "ip",
        ],
      },
      "id": 2,
      "auth": ApiKeys.zabbixToken,
    };

    final tBody = json.decode(
            fixture('datasources/zabbix_remote_data_source/ap_response.json'))
        as Map<String, dynamic>;
    final List<Map<String, dynamic>> result =
        List<Map<String, dynamic>>.from(tBody["result"] as List<dynamic>);
    final List<ZabbixHostModel> tListZabbixHostModel = result
        .map<ZabbixHostModel>(
            (Map<String, dynamic> host) => ZabbixHostModel.fromJson(host))
        .toList();
    test(
      "should perform a GET request",
      () async {
        // arrange
        setUpMockHttpClientSuccess200();
        final String tDataEncoded = json.encode(tData);
        // act
        await dataSource.fetchZabbixHosts(tGroupIds);
        // assert
        verify(mockHttpClient.post(
          '${ApiKeys.zabbixPath}/api_jsonrpc.php',
          headers: {"Content-Type": "application/json-rpc"},
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
        expect(() => call(tGroupIds),
            throwsA(const TypeMatcher<ServerException>()));
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
        expect(() => call(tGroupIds),
            throwsA(const TypeMatcher<ClientException>()));
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
        expect(() => call(tGroupIds),
            throwsA(const TypeMatcher<ClientException>()));
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
        expect(() => call(tGroupIds),
            throwsA(const TypeMatcher<ClientException>()));
      },
    );
  });
}

class MockHttpClient extends Mock implements http.Client {}
