import 'package:connectivity/connectivity.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:minitel_toolbox/core/error/exceptions.dart';
import 'package:minitel_toolbox/core/network/network_info.dart';
import 'package:minitel_toolbox/data/datasources/calendar_url/calendar_url_local_data_source.dart';
import 'package:minitel_toolbox/data/datasources/calendar_url/calendar_url_remote_data_source.dart';
import 'package:minitel_toolbox/domain/repositories/calendar_url_repository.dart';

@LazySingleton(as: CalendarURLRepository)
class CalendarURLRepositoryImpl implements CalendarURLRepository {
  final CalendarURLLocalDataSource localDataSource;
  final CalendarURLRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  const CalendarURLRepositoryImpl({
    @required this.localDataSource,
    @required this.remoteDataSource,
    @required this.networkInfo,
  });

  @override
  Future<String> get({
    @required String username,
    @required String password,
  }) =>
      _get(username: username, password: password);

  Future<String> _get({
    @required String username,
    @required String password,
  }) async {
    if (await networkInfo.result != ConnectivityResult.none) {
      final remoteUrl = await remoteDataSource.getCalendarURL(
        username: username,
        password: password,
      );
      await localDataSource.saveCalendarURL(remoteUrl);

      return remoteUrl;
    } else {
      return localDataSource.getLastCalendarURL();
    }
  }

  @override
  Future<bool> get isSaved async {
    try {
      await localDataSource.getLastCalendarURL();
      return true;
    } on CacheException catch (_) {
      return false;
    }
  }
}
