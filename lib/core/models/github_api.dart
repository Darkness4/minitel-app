import 'package:flutter/foundation.dart';

/// Latest Release of an app generated from Github API
class LatestRelease {
  /// Url to the api of the release
  final String url;

  /// Url output
  final String htmlUrl;

  /// Identificator
  final int id;

  /// Git tag name
  final String tagName;

  /// Github release name
  final String name;

  /// Date of creation
  final DateTime createdAt;

  /// Date of publication
  final DateTime publishedAt;

  final String body;

  const LatestRelease({
    @required this.url,
    @required this.htmlUrl,
    @required this.id,
    @required this.tagName,
    @required this.name,
    @required this.createdAt,
    @required this.publishedAt,
    @required this.body,
  });

  factory LatestRelease.fromJson(Map<String, dynamic> json) {
    return LatestRelease(
      body: json['body'],
      url: json['url'],
      htmlUrl: json['html_url'],
      id: json['id'],
      tagName: json['tag_name'],
      name: json['name'],
      createdAt: DateTime.parse(json['created_at']),
      publishedAt: DateTime.parse(json['published_at']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['body'] = body;
    data['url'] = url;
    data['html_url'] = htmlUrl;
    data['id'] = id;
    data['tag_name'] = tagName;
    data['name'] = name;
    data['created_at'] = createdAt.toIso8601String();
    data['published_at'] = publishedAt.toIso8601String();
    return data;
  }
}
