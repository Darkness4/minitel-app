import 'package:connectivity/connectivity.dart';
import 'package:injectable/injectable.dart';
import 'package:minitel_toolbox/core/network/network_info.dart';
import 'package:minitel_toolbox/data/datasources/twitter/twitter_local_data_source.dart';
import 'package:minitel_toolbox/data/datasources/twitter/twitter_remote_data_source.dart';
import 'package:minitel_toolbox/domain/entities/twitter/post.dart';
import 'package:minitel_toolbox/domain/repositories/post_repository.dart';

@LazySingleton(as: PostRepository)
class PostRepositoryImpl implements PostRepository {
  final TwitterLocalDataSource localDataSource;
  final TwitterRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  const PostRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<List<Post>> fetchAll() async {
    if (await networkInfo.result != ConnectivityResult.none) {
      final remoteFeed = await remoteDataSource.fetchAllPosts();
      await localDataSource.cacheAllPosts(remoteFeed);
      return remoteFeed;
    } else {
      return localDataSource.fetchAllPosts();
    }
  }
}
