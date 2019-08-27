import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:mockito/mockito.dart';

class TestHttpOverrides extends HttpOverrides {
  TestHttpOverrides(this.data);

  final Map<Uri, Uint8List> data;

  @override
  HttpClient createHttpClient(SecurityContext context) =>
      createMockHttpClient(context, data);
}

// Returns a mock HTTP client that responds with an image to all requests.
MockHttpClient createMockHttpClient(
    SecurityContext _, Map<Uri, Uint8List> data) {
  final MockHttpClient client = MockHttpClient();
  final MockHttpClientRequest request = MockHttpClientRequest();
  final MockHttpClientResponse response = MockHttpClientResponse(data);
  final MockHttpHeaders headers = MockHttpHeaders();

  throwOnMissingStub(client);
  throwOnMissingStub(request);
  throwOnMissingStub(response);
  throwOnMissingStub(headers);

  when<dynamic>(client.getUrl(captureAny)).thenAnswer((Invocation invocation) {
    response.requestedUrl = invocation.positionalArguments[0];
    return Future<HttpClientRequest>.value(request);
  });

  when(request.headers).thenAnswer((_) => headers);

  when(request.close())
      .thenAnswer((_) => Future<HttpClientResponse>.value(response));

  when(response.contentLength)
      .thenAnswer((_) => data[response.requestedUrl].length);

  when(response.statusCode).thenReturn(HttpStatus.ok);

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

class MockHttpClient extends Mock implements HttpClient {}

class MockHttpClientRequest extends Mock implements HttpClientRequest {}

class MockHttpClientResponse extends Mock implements HttpClientResponse {
  MockHttpClientResponse(this.data);
  final Map<Uri, Uint8List> data;
  Uri requestedUrl;

  @override
  Future<S> fold<S>(S initialValue, S Function(S, Uint8List) combine) =>
      Stream<Uint8List>.fromIterable(<Uint8List>[data[requestedUrl]])
          .fold<S>(initialValue, combine);

  @override
  Stream<S> transform<S>(StreamTransformer<List<int>, S> streamTransformer) =>
      Stream<List<int>>.fromIterable(<List<int>>[data[requestedUrl]])
          .transform<S>(streamTransformer);
}

class MockHttpHeaders extends Mock implements HttpHeaders {}
