import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:minitel_toolbox/core/error/exceptions.dart';
import 'package:minitel_toolbox/core/files/file_manager.dart';
import 'package:minitel_toolbox/domain/entities/twitter/post.dart';

abstract class TwitterLocalDataSource {
  /// Save Feed to cache
  Future<void> cacheAllPosts(List<Post> posts);

  /// Get last Feed
  Future<List<Post>> fetchAllPosts();
}

@LazySingleton(as: TwitterLocalDataSource)
class TwitterLocalDataSourceImpl implements TwitterLocalDataSource {
  final FileManager fileManager;

  const TwitterLocalDataSourceImpl({@required this.fileManager});

  @override
  Future<void> cacheAllPosts(List<Post> posts) async {
    final file = await fileManager.feedFile;
    return file.writeAsString(
      json.encode(posts.map((Post post) => post.toJson()).toList()),
    );
  }

  @override
  Future<List<Post>> fetchAllPosts() async {
    final file = await fileManager.feedFile;
    final jsonString = file.readAsStringSync();

    if (jsonString != null && jsonString.isNotEmpty) {
      return (json.decode(jsonString) as List<dynamic>)
          .map((dynamic data) => Post.fromMap(data as Map<String, dynamic>))
          .toList();
    } else {
      throw CacheException();
    }
  }
}
