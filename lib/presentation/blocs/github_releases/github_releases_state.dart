part of 'github_releases_bloc.dart';

abstract class GithubReleasesState extends Equatable {
  const GithubReleasesState();
}

class GithubReleasesStateError extends GithubReleasesState {
  final String message;

  const GithubReleasesStateError({@required this.message});

  @override
  List<Object> get props => [message];
}

class GithubReleasesStateInitial extends GithubReleasesState {
  const GithubReleasesStateInitial();
  @override
  List<Object> get props => [];
}

class GithubReleasesStateLoaded extends GithubReleasesState {
  final List<GithubRelease> releases;

  const GithubReleasesStateLoaded({@required this.releases});

  @override
  List<Object> get props => [releases];
}

class GithubReleasesStateLoading extends GithubReleasesState {
  const GithubReleasesStateLoading();
  @override
  List<Object> get props => [];
}
