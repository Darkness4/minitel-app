import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:minitel_toolbox/core/error/exceptions.dart';
import 'package:minitel_toolbox/core/files/file_manager.dart';
import 'package:minitel_toolbox/domain/entities/github/release.dart';

abstract class GithubLocalDataSource {
  // Save Releases to cache
  Future<void> cacheReleases(List<GithubRelease> releasesToCache);

  /// Gets the cached [List<GithubReleaseModel>] which was gotten the last time
  /// the user had an internet connection.
  ///
  /// Throws [CacheException] if no cached data is present.
  Future<List<GithubRelease>> fetchLastReleases();
}

@LazySingleton(as: GithubLocalDataSource)
class GithubLocalDataSourceImpl implements GithubLocalDataSource {
  final FileManager fileManager;

  const GithubLocalDataSourceImpl({@required this.fileManager});

  @override
  Future<void> cacheReleases(List<GithubRelease> releasesToCache) async {
    final file = await fileManager.releasesFile;
    return file.writeAsString(
      json.encode(releasesToCache
          .map((GithubRelease release) => release.toJson())
          .toList()),
    );
  }

  @override
  Future<List<GithubRelease>> fetchLastReleases() async {
    final file = await fileManager.releasesFile;
    if (file.existsSync()) {
      final String jsonString = file.readAsStringSync();
      return List<Map<String, dynamic>>.from(
              json.decode(jsonString) as List<dynamic>)
          .map((Map<String, dynamic> data) => GithubRelease.fromJson(data))
          .toList();
    } else {
      throw CacheException();
    }
  }
}
