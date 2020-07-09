import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:minitel_toolbox/core/constants/api_keys.dart';
import 'package:minitel_toolbox/core/error/exceptions.dart';
import 'package:http/http.dart' as http;
import 'package:minitel_toolbox/domain/entities/twitter/post.dart';

abstract class TwitterRemoteDataSource {
  Future<List<Post>> fetchAllPosts();
  Future<String> getBearerToken();
}

@LazySingleton(as: TwitterRemoteDataSource)
class TwitterRemoteDataSourceImpl implements TwitterRemoteDataSource {
  final http.Client client;
  final StringBuffer tokenBuffer;

  const TwitterRemoteDataSourceImpl({
    @required this.client,
    @required this.tokenBuffer,
  });

  @override
  Future<List<Post>> fetchAllPosts() async {
    final token = await getBearerToken();
    if (token != null) {
      tokenBuffer.clear();
      tokenBuffer.write(token);
    }

    final response = await client.get(
      "https://api.twitter.com/1.1/statuses/user_timeline.json?user_id=1050346583085199361",
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
    );

    if (response.statusCode == HttpStatus.ok) {
      return (json.decode(response.body) as List<dynamic>)
          .map((dynamic data) => Post.fromMap(data as Map<String, dynamic>))
          .toList();
    } else {
      throw ServerException(
          'Failed to load Feed : ${response.statusCode} ${response.reasonPhrase}\n${response.body} ${response.reasonPhrase}\n${response.body}');
    }
  }

  @override
  Future<String> getBearerToken() async {
    final authorization = base64.encode(
        utf8.encode('${ApiKeys.consumerKey}:${ApiKeys.consumerSecret}'));
    final response = await client.post(
      "https://api.twitter.com/oauth2/token",
      headers: {
        HttpHeaders.authorizationHeader: 'Basic $authorization',
      },
      body: {'grant_type': 'client_credentials'},
    );

    if (response.statusCode == HttpStatus.ok) {
      final token = json.decode(response.body)['access_token'] as String;
      if (token != null) {
        tokenBuffer.clear();
        tokenBuffer.write(token);
      }
      return tokenBuffer.toString();
    } else {
      throw ServerException(
          'Failed to load Feed : ${response.statusCode} ${response.reasonPhrase}\n${response.body} ${response.reasonPhrase}\n${response.body}');
    }
  }
}
