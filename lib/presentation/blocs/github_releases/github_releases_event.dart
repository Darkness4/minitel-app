part of 'github_releases_bloc.dart';

@freezed
abstract class GithubReleasesEvent with _$GithubReleasesEvent {
  const factory GithubReleasesEvent.get(String repo) = GetReleasesEvent;
}
