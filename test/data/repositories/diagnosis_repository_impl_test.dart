import 'package:connectivity/connectivity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:minitel_toolbox/core/error/exceptions.dart';
import 'package:minitel_toolbox/core/network/network_info.dart';
import 'package:minitel_toolbox/data/datasources/diagnosis/diagnosis_data_source.dart';
import 'package:minitel_toolbox/data/repositories/diagnosis_repository_impl.dart';
import 'package:minitel_toolbox/domain/entities/diagnosis.dart';
import 'package:minitel_toolbox/domain/repositories/diagnosis_repository.dart';
import 'package:mockito/mockito.dart';

void main() {
  DiagnosisRepository repository;
  MockRemoteDataSource mockRemoteDataSource;
  MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = DiagnosisRepositoryImpl(
      diagnosisDataSource: mockRemoteDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  void runTestsOnline(Function body) {
    group('device is online', () {
      setUp(() {
        when(mockNetworkInfo.result)
            .thenAnswer((_) async => ConnectivityResult.wifi);
      });

      body();
    });
  }

  void runTestsOffline(Function body) {
    group('device is offline', () {
      setUp(() {
        when(mockNetworkInfo.result)
            .thenAnswer((_) async => ConnectivityResult.none);
      });

      body();
    });
  }

  group('diagnose', () {
    final tDiagnosisModel = Diagnosis();

    test(
      'should check if the device is online',
      () async {
        // arrange
        when(mockNetworkInfo.result)
            .thenAnswer((_) async => ConnectivityResult.wifi);
        // act
        await repository.diagnose();
        // assert
        verify(mockNetworkInfo.result);
      },
    );

    runTestsOnline(() {
      test(
        'should return remote data when the call to remote data source is successful',
        () async {
          // arrange
          when(mockRemoteDataSource.diagnose()).thenReturn(tDiagnosisModel);
          // act
          final result = await repository.diagnose();
          // assert
          verify(mockRemoteDataSource.diagnose());
          expect(result, equals(tDiagnosisModel));
        },
      );
    });

    runTestsOffline(() {
      test(
        'should return ClientException when there is no connectivity',
        () async {
          // act
          final call = repository.diagnose;
          // assert
          expect(
            call(),
            throwsA(isInstanceOf<ClientException>()),
          );
        },
      );
    });
  });

  group('get diagnosis', () {
    test('should get a Diagnosis Entity', () {
      // arrange
      final tDiagnosis = Diagnosis();
      when(mockRemoteDataSource.diagnosis).thenReturn(tDiagnosis);
      // act
      final result = repository.diagnosis;
      // assert
      expect(result, equals(tDiagnosis));
    });
  });
}

class MockRemoteDataSource extends Mock implements DiagnosisDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}
