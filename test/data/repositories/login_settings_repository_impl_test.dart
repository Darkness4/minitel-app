import 'package:flutter_test/flutter_test.dart';
import 'package:minitel_toolbox/data/datasources/settings/login_settings_data_source.dart';
import 'package:minitel_toolbox/data/repositories/login_settings_repository_impl.dart';
import 'package:minitel_toolbox/domain/entities/login_settings.dart';
import 'package:minitel_toolbox/domain/repositories/login_settings_repository.dart';
import 'package:mockito/mockito.dart';

void main() {
  LoginSettingsRepository repository;
  MockLocalDataSource mockLocalDataSource;
  const tLoginSettingsModel = LoginSettings();

  setUp(() {
    mockLocalDataSource = MockLocalDataSource();
    repository = LoginSettingsRepositoryImpl(
      localDataSource: mockLocalDataSource,
    );
  });

  group('clear', () {
    test(
      'should call localDataSource.clear()',
      () async {
        // act
        await repository.clear();
        // assert
        verify(mockLocalDataSource.clear());
      },
    );
  });

  group('load', () {
    test(
      'should call localDataSource.load()',
      () async {
        // arrange
        when(mockLocalDataSource.load())
            .thenAnswer((_) async => tLoginSettingsModel);
        // act
        final result = await repository.load();
        // assert
        verify(mockLocalDataSource.load());
        expect(result, equals(tLoginSettingsModel));
      },
    );
  });

  group('save', () {
    test(
      'should call localDataSource.save()',
      () async {
        // arrange
        const tLoginSettings = tLoginSettingsModel;
        // act
        await repository.save(tLoginSettings);
        // assert
        verify(mockLocalDataSource.save(tLoginSettingsModel));
      },
    );
  });
}

class MockLocalDataSource extends Mock implements LoginSettingsDataSource {}
