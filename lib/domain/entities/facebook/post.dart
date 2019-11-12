import 'package:equatable/equatable.dart';

/// Post generated from Facebook Graph API
class Post extends Equatable {
  final String message;
  final String id;
  final String pictureUrl;
  final String permalinkUrl;
  final DateTime createdTime;

  const Post({
    this.message,
    this.id,
    this.pictureUrl,
    this.createdTime,
    this.permalinkUrl,
  });

  @override
  List<Object> get props => [
        message,
        id,
        pictureUrl,
        permalinkUrl,
        createdTime,
      ];
}
