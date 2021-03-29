import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:minitel_toolbox/data/datasources/emse/imprimante_remote_data_source.dart';

@injectable
class FetchPrinterCookies {
  final ImprimanteRemoteDataSource dataSource;

  const FetchPrinterCookies(this.dataSource);

  Future<List<Cookie>> call() async {
    return dataSource.cookies;
  }
}
