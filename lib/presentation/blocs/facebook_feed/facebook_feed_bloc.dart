import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:minitel_toolbox/domain/repositories/feed_repository.dart';

import 'bloc.dart';

class FacebookFeedBloc extends Bloc<FacebookFeedEvent, FacebookFeedState> {
  final FeedRepository repository;

  FacebookFeedBloc({
    @required this.repository,
  }) : assert(repository != null);

  @override
  FacebookFeedState get initialState => const FacebookFeedStateInitial();

  @override
  Stream<FacebookFeedState> mapEventToState(
    FacebookFeedEvent event,
  ) async* {
    if (event is GetFeedEvent) {
      yield const FacebookFeedStateLoading();
      try {
        final feed = await repository.get();
        yield FacebookFeedStateLoaded(feed: feed);
      } catch (e) {
        yield FacebookFeedStateError(message: e.toString());
      }
    }
  }
}
