import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:minitel_toolbox/domain/entities/github/user.dart';

part 'asset.freezed.dart';
part 'asset.g.dart';

@freezed
class GithubAsset with _$GithubAsset {
  @JsonSerializable(explicitToJson: true)
  const factory GithubAsset({
    required String url,
    required String browser_download_url,
    required int id,
    required String node_id,
    required String name,
    required String? label,
    required String state,
    required String content_type,
    required int size,
    required int download_count,
    required DateTime created_at,
    required DateTime updated_at,
    required GithubUser uploader,
  }) = _GithubAsset;

  factory GithubAsset.fromJson(Map<String, dynamic> json) =>
      _$GithubAssetFromJson(json);
}
