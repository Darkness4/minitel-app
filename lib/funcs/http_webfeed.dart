import 'dart:convert';
import 'dart:io';

import 'package:webfeed/webfeed.dart';

Future<AtomFeed> getAtom(String atomUrl) async {
  var client = HttpClient();
  HttpClientRequest request = await client.getUrl(Uri.parse(atomUrl));
  HttpClientResponse response = await request.close();
  var status = await response.transform(Utf8Decoder()).join();
  return AtomFeed.parse(status);
}

Future<RssFeed> getRss(String rssUrl) async {
  var client = HttpClient();
  HttpClientRequest request = await client.getUrl(Uri.parse(rssUrl));
  HttpClientResponse response = await request.close();
  var status = await response.transform(Utf8Decoder()).join();
  return RssFeed.parse(status);
}
