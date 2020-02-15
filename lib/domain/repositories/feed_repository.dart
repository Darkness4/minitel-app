import 'package:minitel_toolbox/domain/entities/twitter/feed.dart';

abstract class FeedRepository {
  Future<Feed> get();
}
