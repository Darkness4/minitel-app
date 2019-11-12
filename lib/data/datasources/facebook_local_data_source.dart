import 'dart:convert';
import 'dart:io';

import 'package:meta/meta.dart';
import 'package:minitel_toolbox/core/error/exceptions.dart';
import 'package:minitel_toolbox/data/models/facebook/feed_model.dart';

abstract class FacebookLocalDataSource {
  /// Save Feed to cache
  Future<void> cacheFeed(FeedModel feedToCache);

  /// Get last Feed
  Future<FeedModel> get lastFeed;
}

class FacebookLocalDataSourceImpl implements FacebookLocalDataSource {
  final File file;

  const FacebookLocalDataSourceImpl({@required this.file});

  @override
  Future<void> cacheFeed(FeedModel feedToCache) {
    return file.writeAsString(
      json.encode(feedToCache.toJson()),
    );
  }

  @override
  Future<FeedModel> get lastFeed async {
    final String jsonString = file.readAsStringSync();
    if (jsonString != null && jsonString.isNotEmpty) {
      return FeedModel.fromJson(
          json.decode(jsonString) as Map<String, dynamic>);
    } else {
      throw CacheException();
    }
  }
}
