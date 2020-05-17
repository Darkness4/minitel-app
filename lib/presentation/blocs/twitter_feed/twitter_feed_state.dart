part of 'twitter_feed_bloc.dart';

@freezed
abstract class TwitterFeedState with _$TwitterFeedState {
  const factory TwitterFeedState.initial() = TwitterFeedStateInitial;
  const factory TwitterFeedState.loading() = TwitterFeedStateLoading;
  const factory TwitterFeedState.loaded(List<Post> feed) =
      TwitterFeedStateLoaded;
  const factory TwitterFeedState.error(Exception error) = TwitterFeedStateError;
}
