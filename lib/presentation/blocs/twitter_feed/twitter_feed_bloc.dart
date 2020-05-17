import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:minitel_toolbox/domain/entities/twitter/feed.dart';
import 'package:minitel_toolbox/domain/repositories/feed_repository.dart';

part 'twitter_feed_bloc.freezed.dart';
part 'twitter_feed_event.dart';
part 'twitter_feed_state.dart';

class TwitterFeedBloc extends Bloc<TwitterFeedEvent, TwitterFeedState> {
  final FeedRepository repository;

  TwitterFeedBloc({
    @required this.repository,
  }) : assert(repository != null);

  @override
  TwitterFeedState get initialState => const TwitterFeedStateInitial();

  @override
  Stream<TwitterFeedState> mapEventToState(
    TwitterFeedEvent event,
  ) async* {
    if (event is GetFeedEvent) {
      yield* _mapGetFeedEventToState();
    }
  }

  Stream<TwitterFeedState> _mapGetFeedEventToState() async* {
    yield const TwitterFeedStateLoading();
    try {
      final feed = await repository.get();
      yield TwitterFeedStateLoaded(feed);
    } on Exception catch (e) {
      yield TwitterFeedStateError(e);
    }
  }
}
