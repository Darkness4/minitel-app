import 'package:minitel_toolbox/domain/entities/login_settings.dart';

abstract class LoginSettingsRepository {
  Future<void> save(LoginSettings settings);
  Future<LoginSettings> load();
  Future<void> clear();
}
