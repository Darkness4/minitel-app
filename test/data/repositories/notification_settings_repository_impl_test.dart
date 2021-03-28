import 'package:flutter_test/flutter_test.dart';
import 'package:minitel_toolbox/data/datasources/settings/notification_settings_data_source.dart';
import 'package:minitel_toolbox/data/repositories/notification_settings_repository_impl.dart';
import 'package:minitel_toolbox/domain/entities/notifications.dart';
import 'package:minitel_toolbox/domain/repositories/notification_settings_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'notification_settings_repository_impl_test.mocks.dart';

@GenerateMocks([], customMocks: [
  MockSpec<NotificationSettingsDataSource>(as: #MockLocalDataSource)
])
void main() {
  late NotificationSettingsRepository repository;
  late MockLocalDataSource mockLocalDataSource;
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
