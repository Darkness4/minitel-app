import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:minitel_toolbox/core/constants/api_constants.dart';
import 'package:minitel_toolbox/core/error/exceptions.dart';
import 'package:minitel_toolbox/data/models/facebook/feed_model.dart';
import 'package:http/http.dart' as http;

abstract class FacebookRemoteDataSource {
  /// Fetch Feed from network
  Future<FeedModel> fetchFeed();
}

class FacebookRemoteDataSourceImpl implements FacebookRemoteDataSource {
  final http.Client client;

  const FacebookRemoteDataSourceImpl({@required this.client});

  @override
  Future<FeedModel> fetchFeed() async {
    final response = await client.get(
        "https://graph.facebook.com/v5.0/me/feed?fields=full_picture,permalink_url,message,created_time&access_token=${ApiConstants.facebookApi}");

    if (response.statusCode == 200) {
      return FeedModel.fromJson(
          json.decode(response.body) as Map<String, dynamic>);
    } else {
      throw ServerException('Failed to load Feed : ${response.statusCode}');
    }
  }
}
