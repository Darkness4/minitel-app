import 'package:injectable/injectable.dart';
import 'package:minitel_toolbox/data/datasources/emse/stormshield_remote_data_source.dart';

@injectable
class LoginToStormshield {
  final StormshieldRemoteDataSource dataSource;

  const LoginToStormshield(this.dataSource);

  Future<void> call({
    required String uid,
    required String pswd,
    required String selectedUrl,
    required int selectedTime,
  }) {
    return dataSource.login(
      uid: uid,
      pswd: pswd,
      selectedUrl: selectedUrl,
      selectedTime: selectedTime,
    );
  }
}
