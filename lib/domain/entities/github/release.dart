import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:minitel_toolbox/domain/entities/github/asset.dart';
import 'package:minitel_toolbox/domain/entities/github/user.dart';

part 'release.freezed.dart';
part 'release.g.dart';

@freezed
class GithubRelease with _$GithubRelease {
  @JsonSerializable(explicitToJson: true)
  const factory GithubRelease({
    required String url,
    required String html_url,
    required String assets_url,
    required String upload_url,
    required String tarball_url,
    required String zipball_url,
    required int id,
    required String node_id,
    required String tag_name,
    required String target_commitish,
    required String name,
    required String body,
    required bool draft,
    required bool prerelease,
    required DateTime created_at,
    required DateTime published_at,
    required GithubUser author,
    required List<GithubAsset> assets,
  }) = _GithubRelease;

  factory GithubRelease.fromJson(Map<String, dynamic> json) =>
      _$GithubReleaseFromJson(json);
}
