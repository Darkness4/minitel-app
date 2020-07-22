import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:minitel_toolbox/domain/entities/github/release.dart';
import 'package:minitel_toolbox/domain/repositories/releases_repository.dart';

part 'github_releases_cubit.freezed.dart';
part 'github_releases_state.dart';

@injectable
class GithubReleasesCubit extends Cubit<GithubReleasesState> {
  final ReleasesRepository repository;

  GithubReleasesCubit({
    @required this.repository,
  })  : assert(repository != null),
        super(const GithubReleasesState.initial());

  Future<void> getReleases(String repo) async {
    emit(const GithubReleasesState.loading());
    try {
      final releases = await repository.get(repo);
      emit(GithubReleasesState.loaded(releases));
    } on Exception catch (e) {
      emit(GithubReleasesState.error(e));
    }
  }
}
