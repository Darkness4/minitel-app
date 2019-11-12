import 'package:connectivity/connectivity.dart';
import 'package:minitel_toolbox/core/network/network_info.dart';
import 'package:minitel_toolbox/data/datasources/facebook_local_data_source.dart';
import 'package:minitel_toolbox/data/datasources/facebook_remote_data_source.dart';
import 'package:minitel_toolbox/domain/entities/facebook/feed.dart';
import 'package:minitel_toolbox/domain/repositories/feed_repository.dart';

class FeedRepositoryImpl implements FeedRepository {
  final FacebookLocalDataSource localDataSource;
  final FacebookRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  const FeedRepositoryImpl({
    this.localDataSource,
    this.remoteDataSource,
    this.networkInfo,
  });

  @override
  Future<Feed> get() => _get();

  Future<Feed> _get() async {
    if (await networkInfo.result != ConnectivityResult.none) {
      final remoteFeed = await remoteDataSource.fetchFeed();
      await localDataSource.cacheFeed(remoteFeed);
      return remoteFeed;
    } else {
      return localDataSource.lastFeed;
    }
  }
}
