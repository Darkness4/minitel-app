import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:minitel_toolbox/core/error/exceptions.dart';
import 'package:minitel_toolbox/domain/entities/github/release.dart';

abstract class GithubRemoteDataSource {
  /// Fetch Releases from network
  Future<List<GithubRelease>> fetchReleases(String repo);
}

@LazySingleton(as: GithubRemoteDataSource)
class GithubRemoteDataSourceImpl implements GithubRemoteDataSource {
  final http.Client client;

  const GithubRemoteDataSourceImpl({required this.client});

  /// [repo] = author/repo
  @override
  Future<List<GithubRelease>> fetchReleases(String repo) async {
    final response = await client
        .get(Uri.parse('https://api.github.com/repos/$repo/releases'));

    if (response.statusCode == HttpStatus.ok) {
      return (json.decode(response.body) as List<dynamic>)
          .map((dynamic data) =>
              GithubRelease.fromJson(data as Map<String, dynamic>))
          .toList();
    } else {
      throw ServerException(
          'Failed to load Releases : ${response.statusCode} ${response.reasonPhrase}\n${response.body}');
    }
  }
}
