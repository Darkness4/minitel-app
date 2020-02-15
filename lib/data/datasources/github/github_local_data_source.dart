import 'dart:convert';
import 'dart:io';

import 'package:meta/meta.dart';
import 'package:minitel_toolbox/core/error/exceptions.dart';
import 'package:minitel_toolbox/data/models/github/release_model.dart';

abstract class GithubLocalDataSource {
  // Save Releases to cache
  Future<void> cacheReleases(List<GithubReleaseModel> releasesToCache);

  /// Gets the cached [List<GithubReleaseModel>] which was gotten the last time
  /// the user had an internet connection.
  ///
  /// Throws [CacheException] if no cached data is present.
  Future<List<GithubReleaseModel>> fetchLastReleases();
}

class GithubLocalDataSourceImpl implements GithubLocalDataSource {
  final File file;

  const GithubLocalDataSourceImpl({@required this.file});

  @override
  Future<void> cacheReleases(List<GithubReleaseModel> releasesToCache) {
    return file.writeAsString(
      json.encode(releasesToCache
          .map((GithubReleaseModel release) => release.toJson())
          .toList()),
    );
  }

  @override
  Future<List<GithubReleaseModel>> fetchLastReleases() async {
    if (file.existsSync()) {
      final String jsonString = file.readAsStringSync();
      return List<Map<String, dynamic>>.from(
              json.decode(jsonString) as List<dynamic>)
          .map((Map<String, dynamic> data) => GithubReleaseModel.fromJson(data))
          .toList();
    } else {
      throw CacheException();
    }
  }
}
