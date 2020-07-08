import 'dart:io';

import 'package:injectable/injectable.dart';

abstract class ProcessManager {
  Future<ProcessResult> run(String command, List<String> args);
}

@LazySingleton(as: ProcessManager)
class ProcessManagerImpl implements ProcessManager {
  const ProcessManagerImpl();

  @override
  Future<ProcessResult> run(String command, List<String> args) =>
      Process.run(command, args);
}
