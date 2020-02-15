import 'dart:convert';
import 'dart:io';

import 'package:meta/meta.dart';
import 'package:minitel_toolbox/core/error/exceptions.dart';
import 'package:minitel_toolbox/data/models/twitter/feed_model.dart';

abstract class TwitterLocalDataSource {
  /// Save Feed to cache
  Future<void> cacheFeed(FeedModel feedToCache);

  /// Get last Feed
  Future<FeedModel> fetchLastFeed();
}

class TwitterLocalDataSourceImpl implements TwitterLocalDataSource {
  final File file;

  const TwitterLocalDataSourceImpl({@required this.file});

  @override
  Future<void> cacheFeed(FeedModel feedToCache) {
    return file.writeAsString(
      json.encode(feedToCache.toJson()),
    );
  }

  @override
  Future<FeedModel> fetchLastFeed() async {
    final String jsonString = file.readAsStringSync();
    if (jsonString != null && jsonString.isNotEmpty) {
      return FeedModel.fromJson(json.decode(jsonString) as List<dynamic>);
    } else {
      throw CacheException();
    }
  }
}
