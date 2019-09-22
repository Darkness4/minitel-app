import 'dart:convert';
import 'dart:io';

import 'package:minitel_toolbox/core/constants/api_constants.dart';
import 'package:minitel_toolbox/core/models/facebook_api/feed.dart';

/// Facebook Graph API 4.0
class FacebookAPI {
  final HttpClient _client = HttpClient();

  /// Get a Feed from Facebook Graph API
  Future<Feed> getFeed() async {
    final HttpClientRequest request = await _client.getUrl(Uri.parse(
        "https://graph.facebook.com/v4.0/me/feed?fields=full_picture,permalink_url,message,created_time&access_token=${ApiConstants.facebookApi}"));
    final HttpClientResponse response = await request.close();
    final Future<Feed> body = response
        .transform(utf8.decoder)
        .transform(json.decoder)
        .map((Object data) => Feed.fromJson(data))
        .first;

    return body;
  }

  /// Get the url to HTTP GET the profile picture
  String getProfilePicture() {
    return "https://graph.facebook.com/v4.0/${ApiConstants.facebookProfileId}/picture?type=large";
  }
}
