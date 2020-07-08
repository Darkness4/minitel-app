import 'package:flutter_test/flutter_test.dart';
import 'package:minitel_toolbox/core/constants/diagnosis_keys.dart';
import 'package:minitel_toolbox/domain/entities/diagnosis.dart';

void main() {
  group('getReport', () {
    test(
      'should return a valid String',
      () async {
        // arrange
        final Diagnosis diagnosis = Diagnosis()
          ..[DiagnosisKeys.ip] = Future.value("testValue");
        // act
        final result = await diagnosis.getReport();
        // assert
        expect(
          result,
          equals(
            '---IP---\n'
            'testValue\n'
            '---END IP---\n'
            '\n'
            '---ip addr---\n'
            '\n'
            '---END ip addr---\n'
            '\n'
            '---Address Resolution Protocol (SU + Busy)---\n'
            '\n'
            '---END Address Resolution Protocol (SU + Busy)---\n'
            '\n'
            '---Traceroute Google (Superuser)---\n'
            '\n'
            '---END Traceroute Google (Superuser)---\n'
            '\n'
            '---Traceroute Google DNS (Superuser)---\n'
            '\n'
            '---END Traceroute Google DNS (Superuser)---\n'
            '\n'
            '---Ping Loopback---\n'
            '\n'
            '---END Ping Loopback---\n'
            '\n'
            '---Ping Local---\n'
            '\n'
            '---END Ping Local---\n'
            '\n'
            '---Ping Gateway---\n'
            '\n'
            '---END Ping Gateway---\n'
            '\n'
            '---Ping DNS 1---\n'
            '\n'
            '---END Ping DNS 1---\n'
            '\n'
            '---Ping DNS 2---\n'
            '\n'
            '---END Ping DNS 2---\n'
            '\n'
            '---Ping DNS 3---\n'
            '\n'
            '---END Ping DNS 3---\n'
            '\n'
            '---Ping DNS 4---\n'
            '\n'
            '---END Ping DNS 4---\n'
            '\n'
            '---Ping DNS 5---\n'
            '\n'
            '---END Ping DNS 5---\n'
            '\n'
            '---NSLookup EMSE---\n'
            '\n'
            '---END NSLookup EMSE---\n'
            '\n'
            '---NSLookup EMSE (SU + Busy)---\n'
            '\n'
            '---END NSLookup EMSE (SU + Busy)---\n'
            '\n'
            '---NSLookup Google---\n'
            '\n'
            '---END NSLookup Google---\n'
            '\n'
            '---NSLookup Google (SU + Busy)---\n'
            '\n'
            '---END NSLookup Google (SU + Busy)---\n'
            '\n'
            '---HTTP Portal Response Public---\n'
            '\n'
            '---END HTTP Portal Response Public---\n'
            '\n'
            '---HTTP Portal Response Gateway---\n'
            '\n'
            '---END HTTP Portal Response Gateway---\n'
            '\n'
            '',
          ),
        );
      },
    );
  });

  group('operator []=', () {
    test(
      'should run and return a valid String with a valid key',
      () async {
        // arrange
        final Diagnosis diagnosis = Diagnosis();
        // act
        final result =
            await (diagnosis[DiagnosisKeys.ip] = Future.value("testValue"));
        // assert
        expect(result, equals("testValue"));
      },
    );

    test(
      'should run and throw a valid String',
      () async {
        // arrange
        final Diagnosis diagnosis = Diagnosis();
        // act
        void call() => diagnosis["Test"] = Future.value("testValue");
        // assert
        expect(call, throwsArgumentError);
      },
    );
  });

  group('operator []', () {
    test(
      'should return a valid String',
      () async {
        // arrange
        final Diagnosis diagnosis = Diagnosis()
          ..[DiagnosisKeys.ip] = Future.value("testValue");
        // act
        final result = await diagnosis[DiagnosisKeys.ip];
        // assert
        expect(result, equals("testValue"));
      },
    );
  });

  group('clear', () {
    test(
      'should throw UnimplementedError',
      () async {
        // arrange
        final Diagnosis diagnosis = Diagnosis()
          ..[DiagnosisKeys.ip] = Future.value("testValue");
        // act
        final call = diagnosis.clear;
        // assert
        expect(call, throwsA(isInstanceOf<UnimplementedError>()));
      },
    );
  });

  group('get keys', () {
    test(
      'should get keys of diagnosis',
      () async {
        // arrange
        final Diagnosis diagnosis = Diagnosis()
          ..[DiagnosisKeys.ip] = Future.value("testValue");
        // act
        final keys = diagnosis.keys;
        // assert
        expect(keys, contains(DiagnosisKeys.ip));
      },
    );
  });

  group('remove', () {
    test(
      'should remove a item in diagnosis',
      () async {
        // arrange
        final Diagnosis diagnosis = Diagnosis()
          ..[DiagnosisKeys.ip] = Future.value("testValue");
        // act
        final call = diagnosis.remove;
        // assert
        expect(() async => call(DiagnosisKeys.ip),
            throwsA(isInstanceOf<UnimplementedError>()));
      },
    );
  });

  group('waitAll', () {
    test(
      'should wait all items in diagnosis and return',
      () async {
        // arrange
        bool cbEnded1 = false;
        bool cbEnded2 = false;
        final Diagnosis diagnosis = Diagnosis()
          ..[DiagnosisKeys.ip] =
              Future.value("value").whenComplete(() => cbEnded1 = true)
          ..[DiagnosisKeys.arp] =
              Future.value("value2").whenComplete(() => cbEnded2 = true);
        // act
        final result = await diagnosis.waitAll();
        // assert
        expect(result[DiagnosisKeys.ip], equals("value"));
        expect(result[DiagnosisKeys.arp], equals("value2"));
        expect(cbEnded1, true);
        expect(cbEnded2, true);
      },
    );
  });
}
