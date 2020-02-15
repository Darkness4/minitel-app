import 'package:equatable/equatable.dart';

/// Notifications settings
class NotificationSettings extends Equatable {
  /// Notify earlier than the indicated time
  final Duration early;

  /// Time range for the notification to work
  final Duration range;

  /// Enable notifications
  final bool enabled;

  const NotificationSettings({this.early, this.range, this.enabled});

  @override
  List<Object> get props => [early, range, enabled];

  NotificationSettings copyWith({
    Duration early,
    Duration range,
    bool enabled,
  }) {
    return NotificationSettings(
      early: early ?? this.early,
      enabled: enabled ?? this.enabled,
      range: range ?? this.range,
    );
  }

  @override
  String toString() {
    return """{
  early: $early,
  enabled: $enabled,
  range: $range,
}""";
  }
}
