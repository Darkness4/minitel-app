part of 'github_releases_cubit.dart';

@freezed
abstract class GithubReleasesState with _$GithubReleasesState {
  const factory GithubReleasesState.initial() = GithubReleasesStateInitial;
  const factory GithubReleasesState.loading() = GithubReleasesStateLoading;
  const factory GithubReleasesState.loaded(List<GithubRelease> releases) =
      GithubReleasesStateLoaded;
  const factory GithubReleasesState.error(Exception error) =
      GithubReleasesStateError;
}
