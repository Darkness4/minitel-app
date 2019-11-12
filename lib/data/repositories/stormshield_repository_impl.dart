import 'package:minitel_toolbox/data/datasources/stormshield_remote_data_source.dart';
import 'package:minitel_toolbox/domain/entities/stormshield.dart';
import 'package:minitel_toolbox/domain/repositories/stormshield_repository.dart';

class StormshieldRepositoryImpl implements StormshieldRepository {
  final StormshieldRemoteDataSource remoteDataSource;

  const StormshieldRepositoryImpl({
    this.remoteDataSource,
  });

  @override
  Future<Stormshield> fetchStatus(String selectedUrl) =>
      remoteDataSource.fetchStatus(selectedUrl);

  @override
  Future<void> login(
          String uid, String pswd, String selectedUrl, int selectedTime) =>
      remoteDataSource.login(uid, pswd, selectedUrl, selectedTime);

  @override
  Future<void> logout(String selectedUrl) =>
      remoteDataSource.logout(selectedUrl);
}
