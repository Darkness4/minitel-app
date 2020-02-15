import 'package:minitel_toolbox/domain/entities/github/release.dart';

abstract class ReleasesRepository {
  Future<List<GithubRelease>> get(String repo);
}
