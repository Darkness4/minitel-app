import 'package:injectable/injectable.dart';
import 'package:minitel_toolbox/data/datasources/settings/login_settings_data_source.dart';
import 'package:minitel_toolbox/domain/entities/login_settings.dart';
import 'package:minitel_toolbox/domain/repositories/login_settings_repository.dart';

@LazySingleton(as: LoginSettingsRepository)
class LoginSettingsRepositoryImpl implements LoginSettingsRepository {
  final LoginSettingsDataSource localDataSource;

  const LoginSettingsRepositoryImpl({this.localDataSource});

  @override
  Future<void> clear() => localDataSource.clear();

  @override
  Future<LoginSettings> load() => localDataSource.load();

  @override
  Future<void> save(LoginSettings settings) => localDataSource.save(settings);
}
