import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:minitel_toolbox/domain/entities/github/user.dart';

part 'asset.freezed.dart';

@freezed
abstract class GithubAsset with _$GithubAsset {
  const factory GithubAsset({
    @required @nullable String url,
    @required @nullable String browser_download_url,
    @required @nullable int id,
    @required @nullable String node_id,
    @required @nullable String name,
    @required @nullable String label,
    @required @nullable String state,
    @required @nullable String content_type,
    @required @nullable int size,
    @required @nullable int download_count,
    @required @nullable DateTime created_at,
    @required @nullable DateTime updated_at,
    @required @nullable GithubUser uploader,
  }) = _GithubAsset;
}
