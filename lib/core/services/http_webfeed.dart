import 'dart:convert';
import 'dart:io';

import 'package:webfeed/webfeed.dart';

/// HTTP Requests for Atom or RSS feed
class WebFeedAPI {
  final _client = HttpClient();
  Future<AtomFeed> getAtom(String atomUrl) async {
    HttpClientRequest request = await _client.getUrl(Uri.parse(atomUrl));
    HttpClientResponse response = await request.close();
    var status =
        await response.cast<List<int>>().transform(utf8.decoder).join();
    return AtomFeed.parse(status);
  }

  Future<RssFeed> getRss(String rssUrl) async {
    HttpClientRequest request = await _client.getUrl(Uri.parse(rssUrl));
    HttpClientResponse response = await request.close();
    var status =
        await response.cast<List<int>>().transform(utf8.decoder).join();
    return RssFeed.parse(status);
  }
}
