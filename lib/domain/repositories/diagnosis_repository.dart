import 'package:minitel_toolbox/data/database/diagnosis.dart';

abstract class DiagnosisRepository {
  /// Run diagnosis suite
  Future<Diagnosis> diagnose();

  Diagnosis get diagnosis;
}
