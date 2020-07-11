import 'package:flutter_test/flutter_test.dart';
import 'package:minitel_toolbox/core/constants/diagnosis_keys.dart';
import 'package:minitel_toolbox/domain/entities/diagnosis.dart';

void main() {
  group('getReport', () {
    test(
      'should return a valid String',
      () async {
        // arrange
        final diagnosis = Diagnosis()
          ..[DiagnosisKeys.ip].complete(Future.value('testValue'));
        // act
        final result = await diagnosis.getReport();
        // assert
        expect(
          result,
          equals(
            '''
---IP---
testValue
---END IP---

---ip addr---
---END ip addr---

---Address Resolution Protocol (SU + Busy)---
---END Address Resolution Protocol (SU + Busy)---

---Traceroute Google (Superuser)---
---END Traceroute Google (Superuser)---

---Traceroute Google DNS (Superuser)---
---END Traceroute Google DNS (Superuser)---

---Ping Loopback---
---END Ping Loopback---

---Ping Local---
---END Ping Local---

---Ping Gateway---
---END Ping Gateway---

---Ping DNS 1---
---END Ping DNS 1---

---Ping DNS 2---
---END Ping DNS 2---

---Ping DNS 3---
---END Ping DNS 3---

---Ping DNS 4---
---END Ping DNS 4---

---Ping DNS 5---
---END Ping DNS 5---

---NSLookup EMSE---
---END NSLookup EMSE---

---NSLookup EMSE (SU + Busy)---
---END NSLookup EMSE (SU + Busy)---

---NSLookup Google---
---END NSLookup Google---

---NSLookup Google (SU + Busy)---
---END NSLookup Google (SU + Busy)---

---HTTP Portal Response Public---
---END HTTP Portal Response Public---

---HTTP Portal Response Gateway---
---END HTTP Portal Response Gateway---

''',
          ),
        );
      },
    );
  });

  group('operator []', () {
    test(
      'should return a valid String',
      () async {
        // arrange
        final diagnosis = Diagnosis()
          ..[DiagnosisKeys.ip].complete(Future.value('testValue'));
        // act
        final result = await diagnosis[DiagnosisKeys.ip].future;
        // assert
        expect(result, equals('testValue'));
      },
    );
  });

  group('clear', () {
    test(
      'should reset all Completer',
      () async {
        // arrange
        final diagnosis = Diagnosis()
          ..[DiagnosisKeys.ip].complete(Future.value('testValue'));
        // act
        diagnosis.clear();
        // assert
        expect(diagnosis[DiagnosisKeys.ip].isCompleted, false);
      },
    );
  });

  group('get keys', () {
    test(
      'should get keys of diagnosis',
      () async {
        // arrange
        final diagnosis = Diagnosis()
          ..[DiagnosisKeys.ip].complete(Future.value('testValue'));
        // act
        final keys = diagnosis.keys;
        // assert
        expect(keys, contains(DiagnosisKeys.ip));
      },
    );
  });

  group('waitAll', () {
    test(
      'should wait all items in diagnosis and return',
      () async {
        // arrange
        final diagnosis = Diagnosis();

        diagnosis.forEach((key, value) => value.complete(Future.value(key)));
        // act
        final result = await diagnosis.waitAll();
        // assert
        result.forEach((key, value) => value == key);
      },
    );
  });
}
