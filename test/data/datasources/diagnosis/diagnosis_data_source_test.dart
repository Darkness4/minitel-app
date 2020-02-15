import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:matcher/matcher.dart';
import 'package:minitel_toolbox/core/constants/app_constants.dart';
import 'package:minitel_toolbox/core/constants/diagnosis_keys.dart';
import 'package:minitel_toolbox/core/internet_address/internet_address_manager.dart';
import 'package:minitel_toolbox/core/process/process_manager.dart';
import 'package:minitel_toolbox/data/datasources/diagnosis/diagnosis_data_source.dart';
import 'package:minitel_toolbox/data/datasources/emse/stormshield_remote_data_source.dart';
import 'package:minitel_toolbox/domain/entities/diagnosis.dart';
import 'package:mockito/mockito.dart';

void main() {
  MockStormshieldRemoteDataSource mockStormshieldRemoteDataSource;
  MockInternetAddressManager mockInternetAddressManager;
  MockProcessManager mockProcessManager;
  MockConnectivity mockConnectivity;
  DiagnosisDataSource dataSource;
  MockDiagnosis mockDiagnosis;

  setUp(() {
    mockStormshieldRemoteDataSource = MockStormshieldRemoteDataSource();
    mockInternetAddressManager = MockInternetAddressManager();
    mockProcessManager = MockProcessManager();
    mockConnectivity = MockConnectivity();
    mockDiagnosis = MockDiagnosis();
    dataSource = DiagnosisDataSourceImpl(
      diagnosis: mockDiagnosis,
      internetAddressManager: mockInternetAddressManager,
      processManager: mockProcessManager,
      connectivity: mockConnectivity,
      stormshieldRemoteDataSource: mockStormshieldRemoteDataSource,
    );
  });

  group('diagnose', () {
    test(
      'should return DiagnosisModel',
      () async {
        // arrange
        final tIpAddress = InternetAddress("1.2.3.4");
        when(mockProcessManager.run(any, any))
            .thenAnswer((_) async => ProcessResult(0, 0, "MOCK", ""));
        when(mockStormshieldRemoteDataSource.fetchStatus(any))
            .thenAnswer((_) async => "MOCK");
        when(mockInternetAddressManager.lookup(any))
            .thenAnswer((_) async => [tIpAddress]);
        when(mockConnectivity.getWifiIP()).thenAnswer((_) async => "0.1.0.1");
        // act
        final result = dataSource.diagnose();
        // assert
        verify(mockStormshieldRemoteDataSource
            .fetchStatus(MyIPAdresses.gatewayIP));
        verify(mockStormshieldRemoteDataSource
            .fetchStatus(MyIPAdresses.stormshieldIP));
        expect(await result[DiagnosisKeys.ip], equals("0.1.0.1"));
        expect(await result[DiagnosisKeys.ipAddr], equals("MOCK"));
        expect(await result[DiagnosisKeys.httpResponseStormshieldPublic],
            equals("MOCK"));
        expect(
            await result[DiagnosisKeys.nsLookupEmse],
            equals(
                "Host: ${tIpAddress.host}\nLookup: ${tIpAddress.address}\n"));
      },
    );

    test(
      'should return DiagnosisModel with a failed DNS Lookup',
      () async {
        // arrange
        when(mockProcessManager.run(any, any))
            .thenAnswer((_) async => ProcessResult(0, 0, "MOCK", ""));
        when(mockStormshieldRemoteDataSource.fetchStatus(any))
            .thenAnswer((_) async => "MOCK");
        when(mockInternetAddressManager.lookup(any))
            .thenAnswer((_) async => throw const SocketException("MOCK"));
        when(mockConnectivity.getWifiIP()).thenAnswer((_) async => "0.1.0.1");
        // act
        final result = dataSource.diagnose();
        // assert
        verify(mockStormshieldRemoteDataSource
            .fetchStatus(MyIPAdresses.gatewayIP));
        verify(mockStormshieldRemoteDataSource
            .fetchStatus(MyIPAdresses.stormshieldIP));
        expect(await result[DiagnosisKeys.nsLookupEmse], contains("MOCK"));
        expect(await result[DiagnosisKeys.ip], equals("0.1.0.1"));
        expect(await result[DiagnosisKeys.ipAddr], equals("MOCK"));
        expect(await result[DiagnosisKeys.httpResponseStormshieldPublic],
            equals("MOCK"));
      },
    );
  });
}

class MockStormshieldRemoteDataSource extends Mock
    implements StormshieldRemoteDataSource {}

class MockProcessManager extends Mock implements ProcessManager {}

class MockInternetAddressManager extends Mock
    implements InternetAddressManager {}

class MockConnectivity extends Mock implements Connectivity {}

class MockDiagnosis extends Mock implements Diagnosis {
  final _internal = <String, Future<String>>{
    DiagnosisKeys.ip: Future<String>.value(""),
    DiagnosisKeys.ipAddr: Future<String>.value(""),
    DiagnosisKeys.arp: Future<String>.value(""),
    DiagnosisKeys.tracerouteGoogle: Future<String>.value(""),
    DiagnosisKeys.tracerouteGoogleDNS: Future<String>.value(""),
    DiagnosisKeys.pingLo: Future<String>.value(""),
    DiagnosisKeys.pingLocal: Future<String>.value(""),
    DiagnosisKeys.pingGateway: Future<String>.value(""),
    DiagnosisKeys.pingDNS1: Future<String>.value(""),
    DiagnosisKeys.pingDNS2: Future<String>.value(""),
    DiagnosisKeys.pingDNS3: Future<String>.value(""),
    DiagnosisKeys.pingDNS4: Future<String>.value(""),
    DiagnosisKeys.pingDNS5: Future<String>.value(""),
    DiagnosisKeys.nsLookupEmse: Future<String>.value(""),
    DiagnosisKeys.nsLookupEmseSU: Future<String>.value(""),
    DiagnosisKeys.nsLookupGoogle: Future<String>.value(""),
    DiagnosisKeys.nsLookupGoogleSU: Future<String>.value(""),
    DiagnosisKeys.httpResponseStormshieldPublic: Future<String>.value(""),
    DiagnosisKeys.httpResponseStormshieldLocal: Future<String>.value(""),
  };

  @override
  Future<String> operator [](Object key) => _internal[key];

  @override
  void operator []=(String key, Future<String> value) {
    if (_internal.containsKey(key)) {
      _internal[key] = value;
    } else {
      throw ArgumentError.value(key, 'key', 'Cannot set value.');
    }
  }
}
