import 'package:injectable/injectable.dart';
import 'package:minitel_toolbox/data/datasources/emse/stormshield_remote_data_source.dart';

@injectable
class FetchStormshieldStatus {
  final StormshieldRemoteDataSource dataSource;

  const FetchStormshieldStatus(this.dataSource);

  Future<String> call(String selectedUrl) {
    return dataSource.fetchStatus(selectedUrl);
  }
}
