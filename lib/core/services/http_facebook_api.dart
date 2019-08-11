import 'dart:convert';
import 'dart:io';

import 'package:minitel_toolbox/core/constants/api_constants.dart';
import 'package:minitel_toolbox/core/models/facebook_api/feed.dart';

class FacebookAPI {
  var _client = HttpClient();

  String getProfilePicture() {
    return "https://graph.facebook.com/v4.0/me/picture?access_token=${ApiConstants.facebookApi}";
  }

  Future<Feed> getFeed() async {
    HttpClientRequest request = await _client.getUrl(Uri.parse(
        "https://graph.facebook.com/v4.0/me/feed?fields=full_picture,message,created_time&access_token=${ApiConstants.facebookApi}"));
    HttpClientResponse response = await request.close();

    var body = await response.cast<List<int>>().transform(utf8.decoder).join();

    return Feed.fromJson(json.decode(body));
  }
}