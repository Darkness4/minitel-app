import 'package:minitel_toolbox/domain/entities/facebook/feed.dart';

abstract class FeedRepository {
  Future<Feed> get();
}
