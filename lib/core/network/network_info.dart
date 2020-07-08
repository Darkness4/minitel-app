import 'package:connectivity/connectivity.dart';
import 'package:injectable/injectable.dart';

abstract class NetworkInfo {
  Future<ConnectivityResult> get result;
}

@LazySingleton(as: NetworkInfo)
class NetworkInfoImpl implements NetworkInfo {
  final Connectivity connectionChecker;

  NetworkInfoImpl(this.connectionChecker);

  @override
  Future<ConnectivityResult> get result =>
      connectionChecker.checkConnectivity();
}
