import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:minitel_toolbox/core/constants/cache_keys.dart';

import 'package:path_provider/path_provider.dart' as path_provider;

@lazySingleton
class FileManager {
  const FileManager();

  Future<Directory> get appDirectory =>
      path_provider.getApplicationDocumentsDirectory();
  Future<File> get feedFile async =>
      File('${(await appDirectory).path}/${CacheKeys.feed}');
  Future<File> get icalendarFile async =>
      File('${(await appDirectory).path}/${CacheKeys.iCalendar}');
  Future<File> get releasesFile async =>
      File('${(await appDirectory).path}/${CacheKeys.releases}');
}
