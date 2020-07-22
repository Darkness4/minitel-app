import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:minitel_toolbox/domain/entities/twitter/post.dart';
import 'package:minitel_toolbox/domain/repositories/post_repository.dart';

part 'twitter_feed_cubit.freezed.dart';
part 'twitter_feed_state.dart';

@injectable
class TwitterFeedCubit extends Cubit<TwitterFeedState> {
  final PostRepository repository;

  TwitterFeedCubit({
    @required this.repository,
  })  : assert(repository != null),
        super(const TwitterFeedStateInitial());

  Future<void> getFeed() async {
    emit(const TwitterFeedStateLoading());
    try {
      final feed = await repository.fetchAll();
      emit(TwitterFeedStateLoaded(feed));
    } on Exception catch (e) {
      emit(TwitterFeedStateError(e));
    }
  }
}
