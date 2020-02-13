import 'package:flutter_test/flutter_test.dart';
import 'package:minitel_toolbox/data/models/twitter/post_model.dart';
import 'package:minitel_toolbox/domain/entities/twitter/post.dart';

void main() {
  final tDateTime = DateTime.parse("2019-10-15T09:11:58Z");
  final tPostModel = PostModel(
    created_at: tDateTime,
    id_str: "id_str",
    user_name: "user_name",
    profile_image_url_https: Uri.parse("https://localhost/image"),
    url: Uri.parse("https://twitter.com/screen_name/status/id_str"),
    screen_name: "screen_name",
    text: "text",
  );

  group('fromJson', () {
    test(
      'should return a valid model',
      () async {
        // arrange
        final Map<String, dynamic> jsonMap = <String, dynamic>{
          "text": "text",
          "id_str": "id_str",
          "user": {
            "profile_image_url_https": "https://localhost/image",
            "screen_name": "screen_name",
            "name": "user_name",
          },
          "created_at": "Tue Oct 15 09:11:58 +0000 2019",
        };
        // act
        final result = PostModel.fromJson(jsonMap);
        // assert
        expect(result, tPostModel);
      },
    );
  });

  group('toJson', () {
    test(
      'should return a JSON map containing the proper data',
      () async {
        // act
        final result = tPostModel.toJson();
        // assert
        final Map<String, dynamic> expectedMap = <String, dynamic>{
          "text": "text",
          "id_str": "id_str",
          "user": {
            "profile_image_url_https": "https://localhost/image",
            "screen_name": "screen_name",
            "name": "user_name",
          },
          "created_at": "Tue Oct 15 09:11:58 +0000 2019",
        };

        expect(result, equals(expectedMap));
      },
    );
  });

  test(
    'should be a subclass of an entity',
    () async {
      // assert
      expect(tPostModel, isA<Post>());
    },
  );

  group('fromEntity', () {
    test(
      'should return a valid model from Entity',
      () async {
        // arrange
        final Post post = tPostModel;
        // act
        final result = PostModel.fromEntity(post);
        // assert
        expect(result, equals(tPostModel));
      },
    );
  });
}
