import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:minitel_toolbox/domain/entities/facebook/feed.dart';

@immutable
abstract class FacebookFeedState extends Equatable {
  const FacebookFeedState();
}

class FacebookFeedStateError extends FacebookFeedState {
  final String message;

  const FacebookFeedStateError({@required this.message});

  @override
  List<Object> get props => [message];
}

class FacebookFeedStateInitial extends FacebookFeedState {
  const FacebookFeedStateInitial();
  @override
  List<Object> get props => [];
}

class FacebookFeedStateLoaded extends FacebookFeedState {
  final Feed feed;

  const FacebookFeedStateLoaded({@required this.feed});

  @override
  List<Object> get props => [feed];
}

class FacebookFeedStateLoading extends FacebookFeedState {
  const FacebookFeedStateLoading();
  @override
  List<Object> get props => [];
}
