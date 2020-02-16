part of 'twitter_feed_bloc.dart';

class GetFeedEvent extends TwitterFeedEvent {
  const GetFeedEvent();

  @override
  List<Object> get props => [];
}

@immutable
abstract class TwitterFeedEvent extends Equatable {
  const TwitterFeedEvent();

  @override
  bool get stringify => true;
}
