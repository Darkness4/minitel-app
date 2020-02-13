import 'dart:convert';

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
          fixture('zabbix_remote_data_source/ap_response.json'),
          200,
          headers: Map<String, String>.from(
              json.decode(fixture('zabbix_remote_data_source/ap_header.json'))
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

  group('fetchZabbixHosts', () {
    // arrange
    const tGroupIds = 17;
    const tToken = 'token';
    const Map<String, Object> tData = <String, dynamic>{
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
      "auth": tToken,
    };

    final tBody =
        json.decode(fixture('zabbix_remote_data_source/ap_response.json'))
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
        await dataSource.fetchZabbixHosts(tGroupIds, token: tToken);
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
        final result =
            await dataSource.fetchZabbixHosts(tGroupIds, token: tToken);

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
        expect(() => call(tGroupIds, token: tToken),
            throwsA(const TypeMatcher<ServerException>()));
      },
    );
  });
}

class MockHttpClient extends Mock implements http.Client {}
