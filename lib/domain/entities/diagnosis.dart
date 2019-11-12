import 'package:equatable/equatable.dart';

class Diagnosis extends Equatable {
  final Map<String, Future<String>> diagnosis;

  const Diagnosis({this.diagnosis});

  Future<String> toStringAsync() async {
    final StringBuffer buffer = StringBuffer();

    for (final entry in diagnosis.entries) {
      buffer.write("---${entry.key}---\n"
          "${await entry.value}\n"
          "---END ${entry.key}---\n\n");
    }
    return buffer.toString();
  }

  @override
  List<Object> get props => <Object>[diagnosis];
}
