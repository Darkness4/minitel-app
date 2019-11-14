import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:minitel_toolbox/core/error/exceptions.dart';
import 'package:minitel_toolbox/data/models/github/release_model.dart';

abstract class GithubRemoteDataSource {
  /// Fetch Releases from network
  Future<List<GithubReleaseModel>> fetchReleases(String repo);
}

class GithubRemoteDataSourceImpl implements GithubRemoteDataSource {
  final http.Client client;

  const GithubRemoteDataSourceImpl({@required this.client});

  /// [repo] = author/repo
  @override
  Future<List<GithubReleaseModel>> fetchReleases(String repo) async {
    final response =
        await client.get('https://api.github.com/repos/$repo/releases');

    if (response.statusCode == 200) {
      return List<Map<String, dynamic>>.from(
              json.decode(response.body) as List<dynamic>)
          .map((Map<String, dynamic> data) => GithubReleaseModel.fromJson(data))
          .toList();
    } else {
      throw ServerException('Failed to load Releases : ${response.statusCode}');
    }
  }
}
