import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:mockito/mockito.dart';

// Returns a mock HTTP client that responds with an image to all requests.
MockHttpClient createMockHttpClient(SecurityContext _, Map<Uri, Uint8List> data,
    {List<Cookie> cookies, Map<String, String> customHeaders}) {
  final MockHttpClient client = MockHttpClient();
  final MockHttpClientRequest request = MockHttpClientRequest();
  final MockHttpClientResponse response = MockHttpClientResponse(data,
      customHeaders: customHeaders, customCookies: cookies);
  final MockHttpHeaders headers = MockHttpHeaders();

  throwOnMissingStub(client);
  throwOnMissingStub(request);
  throwOnMissingStub(response);
  throwOnMissingStub(headers);

  when<dynamic>(client.getUrl(captureAny)).thenAnswer((Invocation invocation) {
    response.requestedUrl = invocation.positionalArguments[0];
    return Future<HttpClientRequest>.value(request);
  });
  when<dynamic>(client.postUrl(captureAny)).thenAnswer((Invocation invocation) {
    response.requestedUrl = invocation.positionalArguments[0];
    return Future<HttpClientRequest>.value(request);
  });

  when(request.cookies).thenAnswer((_) => cookies);

  when(request.close())
      .thenAnswer((_) => Future<HttpClientResponse>.value(response));

  when(request.headers).thenAnswer((_) => headers);

  when(response.contentLength)
      .thenAnswer((_) => data[response.requestedUrl].length);

  when(
    response.listen(
      any,
      cancelOnError: anyNamed('cancelOnError'),
      onDone: anyNamed('onDone'),
      onError: anyNamed('onError'),
    ),
  ).thenAnswer((Invocation invocation) {
    final void Function(Uint8List) onData = invocation.positionalArguments[0];

    final void Function() onDone = invocation.namedArguments[#onDone];

    final void Function(Object, [StackTrace]) onError =
        invocation.namedArguments[#onError];

    final bool cancelOnError = invocation.namedArguments[#cancelOnError];

    return Stream<Uint8List>.fromIterable(
            <Uint8List>[data[response.requestedUrl]])
        .listen(onData,
            onDone: onDone, onError: onError, cancelOnError: cancelOnError);
  });
  return client;
}

class MockHttpClient extends Mock implements HttpClient {
  @override
  set badCertificateCallback(
      bool Function(X509Certificate cert, String host, int port) callback) {}
}

class MockHttpClientRequest extends Mock implements HttpClientRequest {
  @override
  bool followRedirects;

  @override
  void write(Object obj) {}
}

class MockHttpClientResponse extends Mock implements HttpClientResponse {
  final Map<Uri, Uint8List> data;
  final Map<String, String> customHeaders;
  List<Cookie> customCookies = <Cookie>[];
  Uri requestedUrl;

  MockHttpClientResponse(this.data, {this.customHeaders, this.customCookies});

  @override
  List<Cookie> get cookies => customCookies;

  @override
  HttpHeaders get headers {
    final HttpHeaders mockHttpHeaders = MockHttpHeaders();
    if (customHeaders?.isNotEmpty ?? false) {
      customHeaders.forEach(
          (String key, String value) => mockHttpHeaders.set(key, value));
    }
    return mockHttpHeaders;
  }

  @override
  int statusCode = HttpStatus.ok;

  @override
  Future<S> fold<S>(S initialValue, S Function(S, Uint8List) combine) =>
      Stream<Uint8List>.fromIterable(<Uint8List>[data[requestedUrl]])
          .fold<S>(initialValue, combine);

  @override
  Stream<S> transform<S>(StreamTransformer<List<int>, S> streamTransformer) =>
      Stream<List<int>>.fromIterable(<List<int>>[data[requestedUrl]])
          .transform<S>(streamTransformer);
}

class MockHttpHeaders extends Mock implements HttpHeaders {
  Map<String, Object> headers = <String, Object>{};
  @override
  void removeAll(String _) {}

  @override
  ContentType contentType;

  @override
  int contentLength;

  @override
  void set(String name, Object value) => headers[name] = value;

  @override
  String value(String name) => headers[name];

  @override
  List<String> operator [](String name) => <String>[headers[name]];
}
