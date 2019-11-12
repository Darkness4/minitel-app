import 'package:minitel_toolbox/domain/entities/diagnosis.dart';

class DiagnosisModel extends Diagnosis {
  const DiagnosisModel({Map<String, Future<String>> diagnosis})
      : super(diagnosis: diagnosis);
}
