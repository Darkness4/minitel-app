import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
abstract class GithubUser with _$GithubUser {
  const factory GithubUser({
    @required @nullable String login,
    @required @nullable int id,
    @required @nullable String node_id,
    @required @nullable String avatar_url,
    @required @nullable String gravatar_id,
    @required @nullable String url,
    @required @nullable String html_url,
    @required @nullable String followers_url,
    @required @nullable String following_url,
    @required @nullable String gists_url,
    @required @nullable String starred_url,
    @required @nullable String subscriptions_url,
    @required @nullable String organizations_url,
    @required @nullable String repos_url,
    @required @nullable String events_url,
    @required @nullable String received_events_url,
    @required @nullable String type,
    @required @nullable bool site_admin,
    @required @nullable String name,
    @required @nullable String company,
    @required @nullable String blog,
    @required @nullable String location,
    @required @nullable String email,
    @required @nullable bool hireable,
    @required @nullable String bio,
    @required @nullable int public_repos,
    @required @nullable int public_gists,
    @required @nullable int followers,
    @required @nullable int following,
    @required @nullable DateTime created_at,
    @required @nullable DateTime updated_at,
  }) = _GithubUser;
}
