import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:minitel_toolbox/data/datasources/emse/imprimante_remote_data_source.dart';

@injectable
class LoginToPrinter {
  final ImprimanteRemoteDataSource dataSource;

  const LoginToPrinter(this.dataSource);

  Future<List<Cookie>> call({
    required String username,
    required String password,
  }) {
    return dataSource.login(
      username: username,
      password: password,
    );
  }
}
