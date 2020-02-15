import 'package:flutter_test/flutter_test.dart';
import 'package:minitel_toolbox/domain/entities/diagnosis.dart';

void main() {
  group('getReport', () {
    test(
      'should return a valid String',
      () async {
        // arrange
        final Diagnosis diagnosis = Diagnosis()
          ..["Test"] = Future.value("testValue");
        // act
        final result = await diagnosis.getReport();
        // assert
        expect(
          result,
          equals(
            "---Test---\n"
            "testValue\n"
            "---END Test---\n\n",
          ),
        );
      },
    );
  });

  group('operator []=', () {
    test(
      'should run and return a valid String',
      () async {
        // arrange
        final Diagnosis diagnosis = Diagnosis();
        // act
        final result = await (diagnosis["Test"] = Future.value("testValue"));
        // assert
        expect(result, equals("testValue"));
      },
    );
  });

  group('operator []', () {
    test(
      'should return a valid String',
      () async {
        // arrange
        final Diagnosis diagnosis = Diagnosis()
          ..["Test"] = Future.value("testValue");
        // act
        final result = await diagnosis["Test"];
        // assert
        expect(result, equals("testValue"));
      },
    );
  });

  group('clear', () {
    test(
      'should clear diagnosis',
      () async {
        // arrange
        final Diagnosis diagnosis = Diagnosis()
          ..["Test"] = Future.value("testValue");
        // act
        diagnosis.clear();
        // assert
        expect(diagnosis.containsKey("Test"), false);
      },
    );
  });

  group('get keys', () {
    test(
      'should get keys of diagnosis',
      () async {
        // arrange
        final Diagnosis diagnosis = Diagnosis()
          ..["Test"] = Future.value("testValue");
        // act
        final keys = diagnosis.keys;
        // assert
        expect(keys, contains("Test"));
      },
    );
  });

  group('remove', () {
    test(
      'should remove a item in diagnosis',
      () async {
        // arrange
        final Diagnosis diagnosis = Diagnosis()
          ..["Test"] = Future.value("testValue");
        // act
        final result = await diagnosis.remove("Test");
        // assert
        expect(result, equals("testValue"));
        expect(diagnosis.containsKey("Test"), false);
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
          ..["Test"] = Future.value("false").whenComplete(() => cbEnded1 = true)
          ..["Test2"] =
              Future.value("false2").whenComplete(() => cbEnded2 = true);
        // act
        final result = await diagnosis.waitAll();
        // assert
        expect(
          result,
          equals({
            "Test": "false",
            "Test2": "false2",
          }),
        );
        expect(cbEnded1, true);
        expect(cbEnded2, true);
      },
    );
  });
}
