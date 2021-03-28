import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class GithubUser with _$GithubUser {
  @JsonSerializable(explicitToJson: true)
  const factory GithubUser({
    required String? login,
    required int? id,
    required String? node_id,
    required String? avatar_url,
    required String? gravatar_id,
    required String? url,
    required String? html_url,
    required String? followers_url,
    required String? following_url,
    required String? gists_url,
    required String? starred_url,
    required String? subscriptions_url,
    required String? organizations_url,
    required String? repos_url,
    required String? events_url,
    required String? received_events_url,
    required String? type,
    required bool? site_admin,
    required String? name,
    required String? company,
    required String? blog,
    required String? location,
    required String? email,
    required bool? hireable,
    required String? bio,
    required int? public_repos,
    required int? public_gists,
    required int? followers,
    required int? following,
    required DateTime? created_at,
    required DateTime? updated_at,
  }) = _GithubUser;

  factory GithubUser.fromJson(Map<String, dynamic> json) =>
      _$GithubUserFromJson(json);
}
