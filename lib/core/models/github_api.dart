/// Latest Release of an app generated from Github API
class LatestRelease {
  /// Url to the api of the release
  String url;

  /// Url output
  String htmlUrl;

  /// Identificator
  int id;

  /// Git tag name
  String tagName;

  /// Github release name
  String name;

  /// Date of creation
  DateTime createdAt;

  /// Date of publication
  DateTime publishedAt;

  LatestRelease.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    htmlUrl = json['html_url'];
    id = json['id'];
    tagName = json['tag_name'];
    name = json['name'];
    createdAt = DateTime.parse(json['created_at']);
    publishedAt = DateTime.parse(json['published_at']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
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
