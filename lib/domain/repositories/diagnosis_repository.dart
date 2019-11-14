import 'package:minitel_toolbox/domain/entities/diagnosis.dart';

abstract class DiagnosisRepository {
  /// Run diagnosis suite
  Future<Diagnosis> diagnose();
}
