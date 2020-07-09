import 'package:flutter_test/flutter_test.dart';
import 'package:minitel_toolbox/data/datasources/settings/notification_settings_data_source.dart';
import 'package:minitel_toolbox/data/repositories/notification_settings_repository_impl.dart';
import 'package:minitel_toolbox/domain/entities/notifications.dart';
import 'package:minitel_toolbox/domain/repositories/notification_settings_repository.dart';
import 'package:mockito/mockito.dart';

void main() {
  NotificationSettingsRepository repository;
  MockLocalDataSource mockLocalDataSource;
  const tNotificationSettingsModel = NotificationSettings();

  setUp(() {
    mockLocalDataSource = MockLocalDataSource();
    repository = NotificationSettingsRepositoryImpl(
      localDataSource: mockLocalDataSource,
    );
  });

  group('load', () {
    test(
      'should call localDataSource.loadNotificationSettings()',
      () async {
        // arrange
        when(mockLocalDataSource.loadNotificationSettings())
            .thenReturn(tNotificationSettingsModel);
        // act
        final result = repository.load();
        // assert
        verify(mockLocalDataSource.loadNotificationSettings());
        expect(result, equals(tNotificationSettingsModel));
      },
    );
  });

  group('save', () {
    test(
      'should call localDataSource.saveNotificationSettings()',
      () async {
        // arrange
        const tNotificationSettings = tNotificationSettingsModel;
        // act
        await repository.save(tNotificationSettings);
        // assert
        verify(mockLocalDataSource
            .saveNotificationSettings(tNotificationSettingsModel));
      },
    );
  });
}

class MockLocalDataSource extends Mock
    implements NotificationSettingsDataSource {}
