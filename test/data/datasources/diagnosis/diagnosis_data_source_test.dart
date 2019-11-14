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
import 'package:mockito/mockito.dart';

void main() {
  MockStormshieldRemoteDataSource mockStormshieldRemoteDataSource;
  MockInternetAddressManager mockInternetAddressManager;
  MockProcessManager mockProcessManager;
  MockConnectivity mockConnectivity;
  DiagnosisDataSource dataSource;

  setUp(() {
    mockStormshieldRemoteDataSource = MockStormshieldRemoteDataSource();
    mockInternetAddressManager = MockInternetAddressManager();
    mockProcessManager = MockProcessManager();
    mockConnectivity = MockConnectivity();
    dataSource = DiagnosisDataSourceImpl(
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
        expect(result.length, equals(19));
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
  });
}

class MockStormshieldRemoteDataSource extends Mock
    implements StormshieldRemoteDataSource {}

class MockProcessManager extends Mock implements ProcessManager {}

class MockInternetAddressManager extends Mock
    implements InternetAddressManager {}

class MockConnectivity extends Mock implements Connectivity {}
