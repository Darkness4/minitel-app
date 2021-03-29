import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:minitel_toolbox/data/datasources/emse/portail_emse_remote_data_source.dart';

@injectable
class LoginToPortailEmse {
  final PortailEMSERemoteDataSource dataSource;

  const LoginToPortailEmse(this.dataSource);

  Future<List<Cookie>> call({
    required String username,
    required String password,
  }) {
    return dataSource.login(username: username, password: password);
  }
}
