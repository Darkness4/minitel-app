import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:minitel_toolbox/domain/entities/github/release.dart';
import 'package:minitel_toolbox/domain/repositories/releases_repository.dart';

part 'github_releases_bloc.freezed.dart';
part 'github_releases_event.dart';
part 'github_releases_state.dart';

class GithubReleasesBloc
    extends Bloc<GithubReleasesEvent, GithubReleasesState> {
  final ReleasesRepository repository;

  GithubReleasesBloc({
    @required this.repository,
  })  : assert(repository != null),
        super(const GithubReleasesState.initial());

  @override
  Stream<GithubReleasesState> mapEventToState(
    GithubReleasesEvent event,
  ) async* {
    yield* _mapGetReleasesEventToState(event.repo);
  }

  Stream<GithubReleasesState> _mapGetReleasesEventToState(String repo) async* {
    yield const GithubReleasesState.loading();
    try {
      final releases = await repository.get(repo);
      yield GithubReleasesState.loaded(releases);
    } on Exception catch (e) {
      yield GithubReleasesState.error(e);
    }
  }
}
