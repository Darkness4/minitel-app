import 'package:flutter/foundation.dart';

import 'user.dart';

class GithubAsset {
  final String url;
  final int id;
  final GithubUser uploader;
  final int download_count;
  final DateTime created_at;
  final DateTime updated_at;
  final int size;

  const GithubAsset({
    @required this.id,
    @required this.url,
    @required this.uploader,
    @required this.download_count,
    @required this.created_at,
    @required this.updated_at,
    @required this.size,
  });

  factory GithubAsset.fromJson(Map<String, dynamic> json) {
    return GithubAsset(
      url: json['url'],
      id: json['id'],
      uploader: GithubUser.fromJson(json['uploader']),
      download_count: json['download_count'],
      created_at: DateTime.parse(json['created_at']),
      updated_at: DateTime.parse(json['updated_at']),
      size: json['size'],
    );
  }
}
