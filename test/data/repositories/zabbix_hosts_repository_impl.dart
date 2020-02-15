import 'package:flutter_test/flutter_test.dart';
import 'package:minitel_toolbox/data/datasources/zabbix/zabbix_remote_data_source.dart';
import 'package:minitel_toolbox/data/models/zabbix/zabbix_host_model.dart';
import 'package:minitel_toolbox/data/repositories/zabbix_hosts_repository_impl.dart';
import 'package:minitel_toolbox/domain/entities/zabbix/zabbix_host.dart';
import 'package:minitel_toolbox/domain/repositories/zabbix_hosts_repository.dart';
import 'package:mockito/mockito.dart';

void main() {
  ZabbixHostsRepository repository;
  MockRemoteDataSource mockRemoteDataSource;
  const tListZabbixHostModel = <ZabbixHostModel>[ZabbixHostModel()];
  const tGroupids = 1;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    repository = ZabbixHostsRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
    );
  });

  group('get', () {
    test(
      'should call localDataSource.loadNotificationSettings()',
      () async {
        // arrange
        const List<ZabbixHost> tListZabbixHost = tListZabbixHostModel;
        when(mockRemoteDataSource.fetchZabbixHosts(tGroupids))
            .thenAnswer((_) async => tListZabbixHostModel);
        // act
        final result = repository.get(tGroupids);
        // assert
        verify(mockRemoteDataSource.fetchZabbixHosts(tGroupids));
        expect(result, equals(tListZabbixHost));
      },
    );
  });
}

class MockRemoteDataSource extends Mock implements ZabbixRemoteDataSource {}
