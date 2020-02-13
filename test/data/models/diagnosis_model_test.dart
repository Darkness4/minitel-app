import 'package:flutter_test/flutter_test.dart';
import 'package:minitel_toolbox/data/models/diagnosis_model.dart';
import 'package:minitel_toolbox/domain/entities/diagnosis.dart';

void main() {
  final DiagnosisModel tDiagnosisModel = DiagnosisModel();

  test(
    'should be a subclass of Diagnosis entity',
    () async {
      // assert
      expect(tDiagnosisModel, isA<Diagnosis>());
    },
  );
}
