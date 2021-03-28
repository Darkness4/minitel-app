import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:matcher/matcher.dart';
import 'package:minitel_toolbox/core/constants/app_constants.dart';
import 'package:minitel_toolbox/core/constants/diagnosis_keys.dart';
import 'package:minitel_toolbox/core/internet_address/internet_address_manager.dart';
import 'package:minitel_toolbox/core/process/process_manager.dart';
import 'package:minitel_toolbox/data/datasources/diagnosis/diagnosis_data_source.dart';
import 'package:minitel_toolbox/data/datasources/emse/stormshield_remote_data_source.dart';
import 'package:minitel_toolbox/data/database/diagnosis.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'diagnosis_data_source_test.mocks.dart';

@GenerateMocks(
    [StormshieldRemoteDataSource, InternetAddressManager, ProcessManager])
void main() {
  late MockStormshieldRemoteDataSource mockStormshieldRemoteDataSource;
  late MockInternetAddressManager mockInternetAddressManager;
  late MockProcessManager mockProcessManager;
  late DiagnosisDataSource dataSource;
  late Diagnosis mockDiagnosis;

  setUp(() {
    mockStormshieldRemoteDataSource = MockStormshieldRemoteDataSource();
    mockInternetAddressManager = MockInternetAddressManager();
    mockProcessManager = MockProcessManager();
    mockDiagnosis = Diagnosis();
    dataSource = DiagnosisDataSourceImpl(
      diagnosis: mockDiagnosis,
      internetAddressManager: mockInternetAddressManager,
      processManager: mockProcessManager,
      stormshieldRemoteDataSource: mockStormshieldRemoteDataSource,
    );
  });

  group('diagnose', () {
    test(
      'should return DiagnosisModel',
      () async {
        // arrange
        final tIpAddress = InternetAddress('1.2.3.4');
        when(mockProcessManager.run(any, any))
            .thenAnswer((_) async => ProcessResult(0, 0, 'MOCK', ''));
        when(mockStormshieldRemoteDataSource.fetchStatus(any))
            .thenAnswer((_) async => 'MOCK');
        when(mockInternetAddressManager.lookup(any))
            .thenAnswer((_) async => [tIpAddress]);
        // act
        final result = dataSource.diagnose();
        // assert
        verify(mockStormshieldRemoteDataSource
            .fetchStatus(MyIPAdresses.gatewayIP));
        verify(mockStormshieldRemoteDataSource
            .fetchStatus(MyIPAdresses.stormshield));
        expect(await result[DiagnosisKeys.ipAddr]!.future, equals('MOCK'));
        expect(
            await result[DiagnosisKeys.httpResponseStormshieldPublic]!.future,
            equals('MOCK'));
        expect(
            await result[DiagnosisKeys.nsLookupEmse]!.future,
            equals(
                'Host: ${tIpAddress.host}\nLookup: ${tIpAddress.address}\n'));
      },
    );

    test(
      'should return DiagnosisModel with a failed DNS Lookup',
      () async {
        // arrange
        when(mockProcessManager.run(any, any))
            .thenAnswer((_) async => ProcessResult(0, 0, 'MOCK', ''));
        when(mockStormshieldRemoteDataSource.fetchStatus(any))
            .thenAnswer((_) async => 'MOCK');
        when(mockInternetAddressManager.lookup(any))
            .thenAnswer((_) async => throw const SocketException('MOCK'));
        // act
        final result = dataSource.diagnose();
        // assert
        verify(mockStormshieldRemoteDataSource
            .fetchStatus(MyIPAdresses.gatewayIP));
        verify(mockStormshieldRemoteDataSource
            .fetchStatus(MyIPAdresses.stormshield));
        expect(
            await result[DiagnosisKeys.nsLookupEmse]!.future, contains('MOCK'));
        expect(await result[DiagnosisKeys.ipAddr]!.future, equals('MOCK'));
        expect(
            await result[DiagnosisKeys.httpResponseStormshieldPublic]!.future,
            equals('MOCK'));
      },
    );
  });
}
