import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:minitel_toolbox/core/constants/api_keys.dart';
import 'package:minitel_toolbox/core/error/exceptions.dart';
import 'package:http/http.dart' as http;
import 'package:minitel_toolbox/domain/entities/twitter/post.dart';

abstract class TwitterRemoteDataSource {
  Future<List<Post>> fetchAllPosts();
}

class TwitterRemoteDataSourceImpl implements TwitterRemoteDataSource {
  final http.Client client;

  const TwitterRemoteDataSourceImpl({
    @required this.client,
  });

  @override
  Future<List<Post>> fetchAllPosts() async {
    final response = await client.get(
      "https://api.twitter.com/1.1/statuses/user_timeline.json?user_id=1050346583085199361",
      headers: {
        HttpHeaders.authorizationHeader: "Bearer ${ApiKeys.twitterApi}"
      },
    );

    if (response.statusCode == 200) {
      return List<Map<String, dynamic>>.from(
              json.decode(response.body) as List<dynamic>)
          .map((Map<String, dynamic> data) => Post.fromJson(data))
          .toList();
    } else {
      throw ServerException('Failed to load Feed : ${response.statusCode}');
    }
  }
}
