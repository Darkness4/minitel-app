import 'package:minitel_toolbox/domain/entities/stormshield.dart';

abstract class StormshieldRepository {
  Future<void> login(
      String uid, String pswd, String selectedUrl, int selectedTime);
  Future<void> logout(String selectedUrl);
  Future<Stormshield> fetchStatus(String selectedUrl);
}
