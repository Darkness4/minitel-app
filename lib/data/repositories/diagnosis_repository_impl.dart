import 'package:connectivity/connectivity.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:minitel_toolbox/core/error/exceptions.dart';
import 'package:minitel_toolbox/core/network/network_info.dart';
import 'package:minitel_toolbox/data/datasources/diagnosis/diagnosis_data_source.dart';
import 'package:minitel_toolbox/domain/entities/diagnosis.dart';
import 'package:minitel_toolbox/domain/repositories/diagnosis_repository.dart';

@LazySingleton(as: DiagnosisRepository)
class DiagnosisRepositoryImpl implements DiagnosisRepository {
  final DiagnosisDataSource diagnosisDataSource;
  final NetworkInfo networkInfo;

  const DiagnosisRepositoryImpl({
    @required this.diagnosisDataSource,
    @required this.networkInfo,
  });

  @override
  Future<Diagnosis> diagnose() async {
    if (await networkInfo.result != ConnectivityResult.none) {
      return diagnosisDataSource.diagnose();
    } else {
      throw ClientException('No Wi-Fi');
    }
  }

  @override
  Diagnosis get diagnosis => diagnosisDataSource.diagnosis;
}
