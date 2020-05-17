import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:minitel_toolbox/domain/entities/github/asset.dart';
import 'package:minitel_toolbox/domain/entities/github/user.dart';

part 'release.freezed.dart';
part 'release.g.dart';

@freezed
abstract class GithubRelease with _$GithubRelease {
  @JsonSerializable(explicitToJson: true)
  const factory GithubRelease({
    @required @nullable String url,
    @required @nullable String html_url,
    @required @nullable String assets_url,
    @required @nullable String upload_url,
    @required @nullable String tarball_url,
    @required @nullable String zipball_url,
    @required @nullable int id,
    @required @nullable String node_id,
    @required @nullable String tag_name,
    @required @nullable String target_commitish,
    @required @nullable String name,
    @required @nullable String body,
    @required @nullable bool draft,
    @required @nullable bool prerelease,
    @required @nullable DateTime created_at,
    @required @nullable DateTime published_at,
    @required @nullable GithubUser author,
    @required @nullable List<GithubAsset> assets,
  }) = _GithubRelease;

  factory GithubRelease.fromJson(Map<String, dynamic> json) =>
      _$GithubReleaseFromJson(json);
}
