import 'package:injectable/injectable.dart';

abstract class DateTimeManager {
  DateTime now();
}

@LazySingleton(as: DateTimeManager)
class DateTimeManagerImpl implements DateTimeManager {
  const DateTimeManagerImpl();

  @override
  DateTime now() => DateTime.now();
}
