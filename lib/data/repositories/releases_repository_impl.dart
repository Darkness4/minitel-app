import 'package:connectivity/connectivity.dart';
import 'package:injectable/injectable.dart';
import 'package:minitel_toolbox/core/network/network_info.dart';
import 'package:minitel_toolbox/data/datasources/github/github_local_data_source.dart';
import 'package:minitel_toolbox/data/datasources/github/github_remote_data_source.dart';
import 'package:minitel_toolbox/domain/entities/github/release.dart';
import 'package:minitel_toolbox/domain/repositories/releases_repository.dart';

@LazySingleton(as: ReleasesRepository)
class ReleasesRepositoryImpl implements ReleasesRepository {
  final GithubLocalDataSource localDataSource;
  final GithubRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  const ReleasesRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<List<GithubRelease>> get(String repo) {
    return _getReleases(repo);
  }

  Future<List<GithubRelease>> _getReleases(String repo) async {
    if (await networkInfo.result != ConnectivityResult.none) {
      final remoteReleases = await remoteDataSource.fetchReleases(repo);
      await localDataSource.cacheReleases(remoteReleases);
      return remoteReleases;
    } else {
      return localDataSource.fetchLastReleases();
    }
  }
}
