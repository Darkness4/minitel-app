import 'package:minitel_toolbox/domain/entities/twitter/post.dart';

abstract class PostRepository {
  Future<List<Post>> fetchAll();
}
