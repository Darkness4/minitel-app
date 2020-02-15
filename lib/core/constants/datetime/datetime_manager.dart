abstract class DateTimeManager {
  DateTime now();
}

class DateTimeManagerImpl implements DateTimeManager {
  const DateTimeManagerImpl();

  @override
  DateTime now() => DateTime.now();
}
