import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:minitel_toolbox/core/constants/api_keys.dart';
import 'package:minitel_toolbox/core/error/exceptions.dart';
import 'package:http/http.dart' as http;
import 'package:minitel_toolbox/data/models/twitter/feed_model.dart';

abstract class TwitterRemoteDataSource {
  Future<FeedModel> fetchFeed();
}

class TwitterRemoteDataSourceImpl implements TwitterRemoteDataSource {
  final http.Client client;

  const TwitterRemoteDataSourceImpl({
    @required this.client,
  });

  @override
  Future<FeedModel> fetchFeed() async {
    final response = await client.get(
      "https://api.twitter.com/1.1/statuses/user_timeline.json?user_id=1050346583085199361",
      headers: {
        HttpHeaders.authorizationHeader: "Bearer ${ApiKeys.twitterApi}"
      },
    );

    if (response.statusCode == 200) {
      return FeedModel.fromJson(json.decode(response.body) as List<dynamic>);
    } else {
      throw ServerException('Failed to load Feed : ${response.statusCode}');
    }
  }
}
