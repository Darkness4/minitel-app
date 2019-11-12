import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class GetFeedEvent extends FacebookFeedEvent {
  final String repo;

  const GetFeedEvent(this.repo);

  @override
  List<Object> get props => [repo];
}

@immutable
abstract class FacebookFeedEvent extends Equatable {
  const FacebookFeedEvent();
}
