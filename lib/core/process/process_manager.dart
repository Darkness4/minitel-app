import 'dart:io';

abstract class ProcessManager {
  Future<ProcessResult> run(String command, List<String> args);
}

class ProcessManagerImpl implements ProcessManager {
  const ProcessManagerImpl();

  @override
  Future<ProcessResult> run(String command, List<String> args) =>
      Process.run(command, args);
}
