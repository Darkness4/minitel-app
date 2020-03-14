import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:minitel_toolbox/domain/entities/github/release.dart';
import 'package:minitel_toolbox/domain/repositories/releases_repository.dart';

part 'github_releases_event.dart';
part 'github_releases_state.dart';

class GithubReleasesBloc
    extends Bloc<GithubReleasesEvent, GithubReleasesState> {
  final ReleasesRepository repository;

  GithubReleasesBloc({
    @required this.repository,
  }) : assert(repository != null);

  @override
  GithubReleasesState get initialState => const GithubReleasesStateInitial();

  @override
  Stream<GithubReleasesState> mapEventToState(
    GithubReleasesEvent event,
  ) async* {
    if (event is GetReleasesEvent) {
      yield* _mapGetReleasesEventToState(event);
    }
  }

  Stream<GithubReleasesState> _mapGetReleasesEventToState(
      GetReleasesEvent event) async* {
    yield const GithubReleasesStateLoading();
    try {
      final releases = await repository.get(event.repo);
      yield GithubReleasesStateLoaded(releases: releases);
    } catch (e) {
      yield GithubReleasesStateError(message: e.toString());
    }
  }
}
