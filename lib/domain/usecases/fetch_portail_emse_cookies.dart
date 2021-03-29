import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:minitel_toolbox/data/datasources/emse/portail_emse_remote_data_source.dart';

@injectable
class FetchPortailEmseCookies {
  final PortailEMSERemoteDataSource dataSource;

  const FetchPortailEmseCookies(this.dataSource);

  Future<List<Cookie>> call() async {
    return dataSource.cookies;
  }
}
