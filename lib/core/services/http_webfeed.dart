import 'dart:convert';
import 'dart:io';

import 'package:webfeed/webfeed.dart';

/// HTTP Requests for Atom or RSS feed
class WebFeedAPI {
  final HttpClient _client = HttpClient();

  /// Get a parsed Atom feed from url
  Future<AtomFeed> getAtom(String atomUrl) async {
    final HttpClientRequest request = await _client.getUrl(Uri.parse(atomUrl));
    final HttpClientResponse response = await request.close();
    final String status = await response.transform(utf8.decoder).join();
    return AtomFeed.parse(status);
  }

  /// Get a parsed Rss feed from url
  Future<RssFeed> getRss(String rssUrl) async {
    final HttpClientRequest request = await _client.getUrl(Uri.parse(rssUrl));
    final HttpClientResponse response = await request.close();
    final String status = await response.transform(utf8.decoder).join();
    return RssFeed.parse(status);
  }
}
