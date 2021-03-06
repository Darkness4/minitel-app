import 'package:flutter_test/flutter_test.dart';
import 'package:minitel_toolbox/core/error/exceptions.dart';

void main() {
  group('CacheException', () {
    group('toString', () {
      test(
        'if no specific message, return ServerException',
        () async {
          // arrange
          final exception = CacheException();
          // act
          final result = exception.toString();
          // assert
          expect(result, equals('CacheException'));
        },
      );

      test(
        'if specific message, return ServerException: [message]',
        () async {
          // arrange
          final exception = CacheException('message');
          // act
          final result = exception.toString();
          // assert
          expect(result, equals('CacheException: message'));
        },
      );
    });
  });

  group('ServerException', () {
    group('toString', () {
      test(
        'if no specific message, return ServerException',
        () async {
          // arrange
          final exception = ServerException();
          // act
          final result = exception.toString();
          // assert
          expect(result, equals('ServerException'));
        },
      );

      test(
        'if specific message, return ServerException: [message]',
        () async {
          // arrange
          final exception = ServerException('message');
          // act
          final result = exception.toString();
          // assert
          expect(result, equals('ServerException: message'));
        },
      );
    });
  });

  group('ClientException', () {
    group('toString', () {
      test(
        'if no specific message, return ClientException',
        () async {
          // arrange
          final exception = ClientException();
          // act
          final result = exception.toString();
          // assert
          expect(result, equals('ClientException'));
        },
      );

      test(
        'if specific message, return ClientException: [message]',
        () async {
          // arrange
          final exception = ClientException('message');
          // act
          final result = exception.toString();
          // assert
          expect(result, equals('ClientException: message'));
        },
      );
    });
  });

  group('NotLoggedInException', () {
    group('toString', () {
      test(
        'return "Not logged in."',
        () async {
          // arrange
          final exception = NotLoggedInException();
          // act
          final result = exception.toString();
          // assert
          expect(result, equals('Not logged in.'));
        },
      );
    });
  });
}
