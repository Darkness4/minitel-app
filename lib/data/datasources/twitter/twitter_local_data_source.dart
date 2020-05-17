import 'dart:convert';
import 'dart:io';

import 'package:meta/meta.dart';
import 'package:minitel_toolbox/core/error/exceptions.dart';
import 'package:minitel_toolbox/domain/entities/twitter/post.dart';

abstract class TwitterLocalDataSource {
  /// Save Feed to cache
  Future<void> cacheAllPosts(List<Post> posts);

  /// Get last Feed
  Future<List<Post>> fetchAllPosts();
}

class TwitterLocalDataSourceImpl implements TwitterLocalDataSource {
  final File file;

  const TwitterLocalDataSourceImpl({@required this.file});

  @override
  Future<void> cacheAllPosts(List<Post> posts) {
    return file.writeAsString(
      json.encode(posts.map((Post post) => post.toJson()).toList()),
    );
  }

  @override
  Future<List<Post>> fetchAllPosts() async {
    final String jsonString = file.readAsStringSync();
    if (jsonString != null && jsonString.isNotEmpty) {
      return List<Map<String, dynamic>>.from(
              json.decode(jsonString) as List<dynamic>)
          .map((Map<String, dynamic> data) => Post.fromJson(data))
          .toList();
    } else {
      throw CacheException();
    }
  }
}
