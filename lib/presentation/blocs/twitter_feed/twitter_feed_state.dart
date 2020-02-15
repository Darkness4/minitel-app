part of 'twitter_feed_bloc.dart';

@immutable
abstract class TwitterFeedState extends Equatable {
  const TwitterFeedState();
}

class TwitterFeedStateError extends TwitterFeedState {
  final String message;

  const TwitterFeedStateError({@required this.message});

  @override
  List<Object> get props => [message];
}

class TwitterFeedStateInitial extends TwitterFeedState {
  const TwitterFeedStateInitial();
  @override
  List<Object> get props => [];
}

class TwitterFeedStateLoaded extends TwitterFeedState {
  final Feed feed;

  const TwitterFeedStateLoaded({@required this.feed});

  @override
  List<Object> get props => [feed];
}

class TwitterFeedStateLoading extends TwitterFeedState {
  const TwitterFeedStateLoading();
  @override
  List<Object> get props => [];
}
