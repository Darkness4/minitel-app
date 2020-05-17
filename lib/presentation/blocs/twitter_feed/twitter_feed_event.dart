part of 'twitter_feed_bloc.dart';

@freezed
abstract class TwitterFeedEvent with _$TwitterFeedEvent {
  const factory TwitterFeedEvent.get() = GetFeedEvent;
}
