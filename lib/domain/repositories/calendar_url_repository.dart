abstract class CalendarURLRepository {
  Future<String> get({required String username, required String password});
  Future<bool> get isSaved;
}
