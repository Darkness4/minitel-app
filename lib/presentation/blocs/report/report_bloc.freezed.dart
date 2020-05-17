// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'report_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$ReportEventTearOff {
  const _$ReportEventTearOff();

  ReportToInitState toInitState() {
    return const ReportToInitState();
  }

  ReportToShare share(
      {@required @nullable String room,
      @required @nullable String name,
      @required @nullable String title,
      @required @nullable String description,
      @required @nullable Diagnosis diagnosis}) {
    return ReportToShare(
      room: room,
      name: name,
      title: title,
      description: description,
      diagnosis: diagnosis,
    );
  }

  ReportToSlack slack(
      {@required @nullable String room,
      @required @nullable String name,
      @required @nullable String title,
      @required @nullable String description,
      @required @nullable Diagnosis diagnosis,
      String channel = 'minitel_toolbox_notifications'}) {
    return ReportToSlack(
      room: room,
      name: name,
      title: title,
      description: description,
      diagnosis: diagnosis,
      channel: channel,
    );
  }

  ReportToMail mail(
      {@required @nullable String room,
      @required @nullable String name,
      @required @nullable String title,
      @required @nullable String description,
      @required @nullable Diagnosis diagnosis}) {
    return ReportToMail(
      room: room,
      name: name,
      title: title,
      description: description,
      diagnosis: diagnosis,
    );
  }
}

// ignore: unused_element
const $ReportEvent = _$ReportEventTearOff();

mixin _$ReportEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result toInitState(),
    @required
        Result share(
            @nullable String room,
            @nullable String name,
            @nullable String title,
            @nullable String description,
            @nullable Diagnosis diagnosis),
    @required
        Result slack(
            @nullable String room,
            @nullable String name,
            @nullable String title,
            @nullable String description,
            @nullable Diagnosis diagnosis,
            String channel),
    @required
        Result mail(
            @nullable String room,
            @nullable String name,
            @nullable String title,
            @nullable String description,
            @nullable Diagnosis diagnosis),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result toInitState(),
    Result share(
        @nullable String room,
        @nullable String name,
        @nullable String title,
        @nullable String description,
        @nullable Diagnosis diagnosis),
    Result slack(
        @nullable String room,
        @nullable String name,
        @nullable String title,
        @nullable String description,
        @nullable Diagnosis diagnosis,
        String channel),
    Result mail(
        @nullable String room,
        @nullable String name,
        @nullable String title,
        @nullable String description,
        @nullable Diagnosis diagnosis),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result toInitState(ReportToInitState value),
    @required Result share(ReportToShare value),
    @required Result slack(ReportToSlack value),
    @required Result mail(ReportToMail value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result toInitState(ReportToInitState value),
    Result share(ReportToShare value),
    Result slack(ReportToSlack value),
    Result mail(ReportToMail value),
    @required Result orElse(),
  });
}

abstract class $ReportEventCopyWith<$Res> {
  factory $ReportEventCopyWith(
          ReportEvent value, $Res Function(ReportEvent) then) =
      _$ReportEventCopyWithImpl<$Res>;
}

class _$ReportEventCopyWithImpl<$Res> implements $ReportEventCopyWith<$Res> {
  _$ReportEventCopyWithImpl(this._value, this._then);

  final ReportEvent _value;
  // ignore: unused_field
  final $Res Function(ReportEvent) _then;
}

abstract class $ReportToInitStateCopyWith<$Res> {
  factory $ReportToInitStateCopyWith(
          ReportToInitState value, $Res Function(ReportToInitState) then) =
      _$ReportToInitStateCopyWithImpl<$Res>;
}

class _$ReportToInitStateCopyWithImpl<$Res>
    extends _$ReportEventCopyWithImpl<$Res>
    implements $ReportToInitStateCopyWith<$Res> {
  _$ReportToInitStateCopyWithImpl(
      ReportToInitState _value, $Res Function(ReportToInitState) _then)
      : super(_value, (v) => _then(v as ReportToInitState));

  @override
  ReportToInitState get _value => super._value as ReportToInitState;
}

class _$ReportToInitState
    with DiagnosticableTreeMixin
    implements ReportToInitState {
  const _$ReportToInitState();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ReportEvent.toInitState()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'ReportEvent.toInitState'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ReportToInitState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result toInitState(),
    @required
        Result share(
            @nullable String room,
            @nullable String name,
            @nullable String title,
            @nullable String description,
            @nullable Diagnosis diagnosis),
    @required
        Result slack(
            @nullable String room,
            @nullable String name,
            @nullable String title,
            @nullable String description,
            @nullable Diagnosis diagnosis,
            String channel),
    @required
        Result mail(
            @nullable String room,
            @nullable String name,
            @nullable String title,
            @nullable String description,
            @nullable Diagnosis diagnosis),
  }) {
    assert(toInitState != null);
    assert(share != null);
    assert(slack != null);
    assert(mail != null);
    return toInitState();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result toInitState(),
    Result share(
        @nullable String room,
        @nullable String name,
        @nullable String title,
        @nullable String description,
        @nullable Diagnosis diagnosis),
    Result slack(
        @nullable String room,
        @nullable String name,
        @nullable String title,
        @nullable String description,
        @nullable Diagnosis diagnosis,
        String channel),
    Result mail(
        @nullable String room,
        @nullable String name,
        @nullable String title,
        @nullable String description,
        @nullable Diagnosis diagnosis),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (toInitState != null) {
      return toInitState();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result toInitState(ReportToInitState value),
    @required Result share(ReportToShare value),
    @required Result slack(ReportToSlack value),
    @required Result mail(ReportToMail value),
  }) {
    assert(toInitState != null);
    assert(share != null);
    assert(slack != null);
    assert(mail != null);
    return toInitState(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result toInitState(ReportToInitState value),
    Result share(ReportToShare value),
    Result slack(ReportToSlack value),
    Result mail(ReportToMail value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (toInitState != null) {
      return toInitState(this);
    }
    return orElse();
  }
}

abstract class ReportToInitState implements ReportEvent {
  const factory ReportToInitState() = _$ReportToInitState;
}

abstract class $ReportToShareCopyWith<$Res> {
  factory $ReportToShareCopyWith(
          ReportToShare value, $Res Function(ReportToShare) then) =
      _$ReportToShareCopyWithImpl<$Res>;
  $Res call(
      {@nullable String room,
      @nullable String name,
      @nullable String title,
      @nullable String description,
      @nullable Diagnosis diagnosis});
}

class _$ReportToShareCopyWithImpl<$Res> extends _$ReportEventCopyWithImpl<$Res>
    implements $ReportToShareCopyWith<$Res> {
  _$ReportToShareCopyWithImpl(
      ReportToShare _value, $Res Function(ReportToShare) _then)
      : super(_value, (v) => _then(v as ReportToShare));

  @override
  ReportToShare get _value => super._value as ReportToShare;

  @override
  $Res call({
    Object room = freezed,
    Object name = freezed,
    Object title = freezed,
    Object description = freezed,
    Object diagnosis = freezed,
  }) {
    return _then(ReportToShare(
      room: room == freezed ? _value.room : room as String,
      name: name == freezed ? _value.name : name as String,
      title: title == freezed ? _value.title : title as String,
      description:
          description == freezed ? _value.description : description as String,
      diagnosis:
          diagnosis == freezed ? _value.diagnosis : diagnosis as Diagnosis,
    ));
  }
}

class _$ReportToShare with DiagnosticableTreeMixin implements ReportToShare {
  const _$ReportToShare(
      {@required @nullable this.room,
      @required @nullable this.name,
      @required @nullable this.title,
      @required @nullable this.description,
      @required @nullable this.diagnosis});

  @override
  @nullable
  final String room;
  @override
  @nullable
  final String name;
  @override
  @nullable
  final String title;
  @override
  @nullable
  final String description;
  @override
  @nullable
  final Diagnosis diagnosis;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ReportEvent.share(room: $room, name: $name, title: $title, description: $description, diagnosis: $diagnosis)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ReportEvent.share'))
      ..add(DiagnosticsProperty('room', room))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('diagnosis', diagnosis));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ReportToShare &&
            (identical(other.room, room) ||
                const DeepCollectionEquality().equals(other.room, room)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.diagnosis, diagnosis) ||
                const DeepCollectionEquality()
                    .equals(other.diagnosis, diagnosis)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(room) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(diagnosis);

  @override
  $ReportToShareCopyWith<ReportToShare> get copyWith =>
      _$ReportToShareCopyWithImpl<ReportToShare>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result toInitState(),
    @required
        Result share(
            @nullable String room,
            @nullable String name,
            @nullable String title,
            @nullable String description,
            @nullable Diagnosis diagnosis),
    @required
        Result slack(
            @nullable String room,
            @nullable String name,
            @nullable String title,
            @nullable String description,
            @nullable Diagnosis diagnosis,
            String channel),
    @required
        Result mail(
            @nullable String room,
            @nullable String name,
            @nullable String title,
            @nullable String description,
            @nullable Diagnosis diagnosis),
  }) {
    assert(toInitState != null);
    assert(share != null);
    assert(slack != null);
    assert(mail != null);
    return share(room, name, title, description, diagnosis);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result toInitState(),
    Result share(
        @nullable String room,
        @nullable String name,
        @nullable String title,
        @nullable String description,
        @nullable Diagnosis diagnosis),
    Result slack(
        @nullable String room,
        @nullable String name,
        @nullable String title,
        @nullable String description,
        @nullable Diagnosis diagnosis,
        String channel),
    Result mail(
        @nullable String room,
        @nullable String name,
        @nullable String title,
        @nullable String description,
        @nullable Diagnosis diagnosis),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (share != null) {
      return share(room, name, title, description, diagnosis);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result toInitState(ReportToInitState value),
    @required Result share(ReportToShare value),
    @required Result slack(ReportToSlack value),
    @required Result mail(ReportToMail value),
  }) {
    assert(toInitState != null);
    assert(share != null);
    assert(slack != null);
    assert(mail != null);
    return share(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result toInitState(ReportToInitState value),
    Result share(ReportToShare value),
    Result slack(ReportToSlack value),
    Result mail(ReportToMail value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (share != null) {
      return share(this);
    }
    return orElse();
  }
}

abstract class ReportToShare implements ReportEvent {
  const factory ReportToShare(
      {@required @nullable String room,
      @required @nullable String name,
      @required @nullable String title,
      @required @nullable String description,
      @required @nullable Diagnosis diagnosis}) = _$ReportToShare;

  @nullable
  String get room;
  @nullable
  String get name;
  @nullable
  String get title;
  @nullable
  String get description;
  @nullable
  Diagnosis get diagnosis;
  $ReportToShareCopyWith<ReportToShare> get copyWith;
}

abstract class $ReportToSlackCopyWith<$Res> {
  factory $ReportToSlackCopyWith(
          ReportToSlack value, $Res Function(ReportToSlack) then) =
      _$ReportToSlackCopyWithImpl<$Res>;
  $Res call(
      {@nullable String room,
      @nullable String name,
      @nullable String title,
      @nullable String description,
      @nullable Diagnosis diagnosis,
      String channel});
}

class _$ReportToSlackCopyWithImpl<$Res> extends _$ReportEventCopyWithImpl<$Res>
    implements $ReportToSlackCopyWith<$Res> {
  _$ReportToSlackCopyWithImpl(
      ReportToSlack _value, $Res Function(ReportToSlack) _then)
      : super(_value, (v) => _then(v as ReportToSlack));

  @override
  ReportToSlack get _value => super._value as ReportToSlack;

  @override
  $Res call({
    Object room = freezed,
    Object name = freezed,
    Object title = freezed,
    Object description = freezed,
    Object diagnosis = freezed,
    Object channel = freezed,
  }) {
    return _then(ReportToSlack(
      room: room == freezed ? _value.room : room as String,
      name: name == freezed ? _value.name : name as String,
      title: title == freezed ? _value.title : title as String,
      description:
          description == freezed ? _value.description : description as String,
      diagnosis:
          diagnosis == freezed ? _value.diagnosis : diagnosis as Diagnosis,
      channel: channel == freezed ? _value.channel : channel as String,
    ));
  }
}

class _$ReportToSlack with DiagnosticableTreeMixin implements ReportToSlack {
  const _$ReportToSlack(
      {@required @nullable this.room,
      @required @nullable this.name,
      @required @nullable this.title,
      @required @nullable this.description,
      @required @nullable this.diagnosis,
      this.channel = 'minitel_toolbox_notifications'})
      : assert(channel != null);

  @override
  @nullable
  final String room;
  @override
  @nullable
  final String name;
  @override
  @nullable
  final String title;
  @override
  @nullable
  final String description;
  @override
  @nullable
  final Diagnosis diagnosis;
  @JsonKey(defaultValue: 'minitel_toolbox_notifications')
  @override
  final String channel;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ReportEvent.slack(room: $room, name: $name, title: $title, description: $description, diagnosis: $diagnosis, channel: $channel)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ReportEvent.slack'))
      ..add(DiagnosticsProperty('room', room))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('diagnosis', diagnosis))
      ..add(DiagnosticsProperty('channel', channel));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ReportToSlack &&
            (identical(other.room, room) ||
                const DeepCollectionEquality().equals(other.room, room)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.diagnosis, diagnosis) ||
                const DeepCollectionEquality()
                    .equals(other.diagnosis, diagnosis)) &&
            (identical(other.channel, channel) ||
                const DeepCollectionEquality().equals(other.channel, channel)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(room) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(diagnosis) ^
      const DeepCollectionEquality().hash(channel);

  @override
  $ReportToSlackCopyWith<ReportToSlack> get copyWith =>
      _$ReportToSlackCopyWithImpl<ReportToSlack>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result toInitState(),
    @required
        Result share(
            @nullable String room,
            @nullable String name,
            @nullable String title,
            @nullable String description,
            @nullable Diagnosis diagnosis),
    @required
        Result slack(
            @nullable String room,
            @nullable String name,
            @nullable String title,
            @nullable String description,
            @nullable Diagnosis diagnosis,
            String channel),
    @required
        Result mail(
            @nullable String room,
            @nullable String name,
            @nullable String title,
            @nullable String description,
            @nullable Diagnosis diagnosis),
  }) {
    assert(toInitState != null);
    assert(share != null);
    assert(slack != null);
    assert(mail != null);
    return slack(room, name, title, description, diagnosis, channel);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result toInitState(),
    Result share(
        @nullable String room,
        @nullable String name,
        @nullable String title,
        @nullable String description,
        @nullable Diagnosis diagnosis),
    Result slack(
        @nullable String room,
        @nullable String name,
        @nullable String title,
        @nullable String description,
        @nullable Diagnosis diagnosis,
        String channel),
    Result mail(
        @nullable String room,
        @nullable String name,
        @nullable String title,
        @nullable String description,
        @nullable Diagnosis diagnosis),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (slack != null) {
      return slack(room, name, title, description, diagnosis, channel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result toInitState(ReportToInitState value),
    @required Result share(ReportToShare value),
    @required Result slack(ReportToSlack value),
    @required Result mail(ReportToMail value),
  }) {
    assert(toInitState != null);
    assert(share != null);
    assert(slack != null);
    assert(mail != null);
    return slack(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result toInitState(ReportToInitState value),
    Result share(ReportToShare value),
    Result slack(ReportToSlack value),
    Result mail(ReportToMail value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (slack != null) {
      return slack(this);
    }
    return orElse();
  }
}

abstract class ReportToSlack implements ReportEvent {
  const factory ReportToSlack(
      {@required @nullable String room,
      @required @nullable String name,
      @required @nullable String title,
      @required @nullable String description,
      @required @nullable Diagnosis diagnosis,
      String channel}) = _$ReportToSlack;

  @nullable
  String get room;
  @nullable
  String get name;
  @nullable
  String get title;
  @nullable
  String get description;
  @nullable
  Diagnosis get diagnosis;
  String get channel;
  $ReportToSlackCopyWith<ReportToSlack> get copyWith;
}

abstract class $ReportToMailCopyWith<$Res> {
  factory $ReportToMailCopyWith(
          ReportToMail value, $Res Function(ReportToMail) then) =
      _$ReportToMailCopyWithImpl<$Res>;
  $Res call(
      {@nullable String room,
      @nullable String name,
      @nullable String title,
      @nullable String description,
      @nullable Diagnosis diagnosis});
}

class _$ReportToMailCopyWithImpl<$Res> extends _$ReportEventCopyWithImpl<$Res>
    implements $ReportToMailCopyWith<$Res> {
  _$ReportToMailCopyWithImpl(
      ReportToMail _value, $Res Function(ReportToMail) _then)
      : super(_value, (v) => _then(v as ReportToMail));

  @override
  ReportToMail get _value => super._value as ReportToMail;

  @override
  $Res call({
    Object room = freezed,
    Object name = freezed,
    Object title = freezed,
    Object description = freezed,
    Object diagnosis = freezed,
  }) {
    return _then(ReportToMail(
      room: room == freezed ? _value.room : room as String,
      name: name == freezed ? _value.name : name as String,
      title: title == freezed ? _value.title : title as String,
      description:
          description == freezed ? _value.description : description as String,
      diagnosis:
          diagnosis == freezed ? _value.diagnosis : diagnosis as Diagnosis,
    ));
  }
}

class _$ReportToMail with DiagnosticableTreeMixin implements ReportToMail {
  const _$ReportToMail(
      {@required @nullable this.room,
      @required @nullable this.name,
      @required @nullable this.title,
      @required @nullable this.description,
      @required @nullable this.diagnosis});

  @override
  @nullable
  final String room;
  @override
  @nullable
  final String name;
  @override
  @nullable
  final String title;
  @override
  @nullable
  final String description;
  @override
  @nullable
  final Diagnosis diagnosis;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ReportEvent.mail(room: $room, name: $name, title: $title, description: $description, diagnosis: $diagnosis)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ReportEvent.mail'))
      ..add(DiagnosticsProperty('room', room))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('diagnosis', diagnosis));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ReportToMail &&
            (identical(other.room, room) ||
                const DeepCollectionEquality().equals(other.room, room)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.diagnosis, diagnosis) ||
                const DeepCollectionEquality()
                    .equals(other.diagnosis, diagnosis)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(room) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(diagnosis);

  @override
  $ReportToMailCopyWith<ReportToMail> get copyWith =>
      _$ReportToMailCopyWithImpl<ReportToMail>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result toInitState(),
    @required
        Result share(
            @nullable String room,
            @nullable String name,
            @nullable String title,
            @nullable String description,
            @nullable Diagnosis diagnosis),
    @required
        Result slack(
            @nullable String room,
            @nullable String name,
            @nullable String title,
            @nullable String description,
            @nullable Diagnosis diagnosis,
            String channel),
    @required
        Result mail(
            @nullable String room,
            @nullable String name,
            @nullable String title,
            @nullable String description,
            @nullable Diagnosis diagnosis),
  }) {
    assert(toInitState != null);
    assert(share != null);
    assert(slack != null);
    assert(mail != null);
    return mail(room, name, title, description, diagnosis);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result toInitState(),
    Result share(
        @nullable String room,
        @nullable String name,
        @nullable String title,
        @nullable String description,
        @nullable Diagnosis diagnosis),
    Result slack(
        @nullable String room,
        @nullable String name,
        @nullable String title,
        @nullable String description,
        @nullable Diagnosis diagnosis,
        String channel),
    Result mail(
        @nullable String room,
        @nullable String name,
        @nullable String title,
        @nullable String description,
        @nullable Diagnosis diagnosis),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (mail != null) {
      return mail(room, name, title, description, diagnosis);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result toInitState(ReportToInitState value),
    @required Result share(ReportToShare value),
    @required Result slack(ReportToSlack value),
    @required Result mail(ReportToMail value),
  }) {
    assert(toInitState != null);
    assert(share != null);
    assert(slack != null);
    assert(mail != null);
    return mail(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result toInitState(ReportToInitState value),
    Result share(ReportToShare value),
    Result slack(ReportToSlack value),
    Result mail(ReportToMail value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (mail != null) {
      return mail(this);
    }
    return orElse();
  }
}

abstract class ReportToMail implements ReportEvent {
  const factory ReportToMail(
      {@required @nullable String room,
      @required @nullable String name,
      @required @nullable String title,
      @required @nullable String description,
      @required @nullable Diagnosis diagnosis}) = _$ReportToMail;

  @nullable
  String get room;
  @nullable
  String get name;
  @nullable
  String get title;
  @nullable
  String get description;
  @nullable
  Diagnosis get diagnosis;
  $ReportToMailCopyWith<ReportToMail> get copyWith;
}

class _$ReportStateTearOff {
  const _$ReportStateTearOff();

  ReportInitial initial() {
    return const ReportInitial();
  }

  ReportLoading loading() {
    return const ReportLoading();
  }

  ReportDone done(@nullable String status) {
    return ReportDone(
      status,
    );
  }

  ReportError error(Exception error) {
    return ReportError(
      error,
    );
  }
}

// ignore: unused_element
const $ReportState = _$ReportStateTearOff();

mixin _$ReportState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required Result done(@nullable String status),
    @required Result error(Exception error),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(),
    Result done(@nullable String status),
    Result error(Exception error),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(ReportInitial value),
    @required Result loading(ReportLoading value),
    @required Result done(ReportDone value),
    @required Result error(ReportError value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(ReportInitial value),
    Result loading(ReportLoading value),
    Result done(ReportDone value),
    Result error(ReportError value),
    @required Result orElse(),
  });
}

abstract class $ReportStateCopyWith<$Res> {
  factory $ReportStateCopyWith(
          ReportState value, $Res Function(ReportState) then) =
      _$ReportStateCopyWithImpl<$Res>;
}

class _$ReportStateCopyWithImpl<$Res> implements $ReportStateCopyWith<$Res> {
  _$ReportStateCopyWithImpl(this._value, this._then);

  final ReportState _value;
  // ignore: unused_field
  final $Res Function(ReportState) _then;
}

abstract class $ReportInitialCopyWith<$Res> {
  factory $ReportInitialCopyWith(
          ReportInitial value, $Res Function(ReportInitial) then) =
      _$ReportInitialCopyWithImpl<$Res>;
}

class _$ReportInitialCopyWithImpl<$Res> extends _$ReportStateCopyWithImpl<$Res>
    implements $ReportInitialCopyWith<$Res> {
  _$ReportInitialCopyWithImpl(
      ReportInitial _value, $Res Function(ReportInitial) _then)
      : super(_value, (v) => _then(v as ReportInitial));

  @override
  ReportInitial get _value => super._value as ReportInitial;
}

class _$ReportInitial with DiagnosticableTreeMixin implements ReportInitial {
  const _$ReportInitial();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ReportState.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'ReportState.initial'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ReportInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required Result done(@nullable String status),
    @required Result error(Exception error),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(done != null);
    assert(error != null);
    return initial();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(),
    Result done(@nullable String status),
    Result error(Exception error),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(ReportInitial value),
    @required Result loading(ReportLoading value),
    @required Result done(ReportDone value),
    @required Result error(ReportError value),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(done != null);
    assert(error != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(ReportInitial value),
    Result loading(ReportLoading value),
    Result done(ReportDone value),
    Result error(ReportError value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class ReportInitial implements ReportState {
  const factory ReportInitial() = _$ReportInitial;
}

abstract class $ReportLoadingCopyWith<$Res> {
  factory $ReportLoadingCopyWith(
          ReportLoading value, $Res Function(ReportLoading) then) =
      _$ReportLoadingCopyWithImpl<$Res>;
}

class _$ReportLoadingCopyWithImpl<$Res> extends _$ReportStateCopyWithImpl<$Res>
    implements $ReportLoadingCopyWith<$Res> {
  _$ReportLoadingCopyWithImpl(
      ReportLoading _value, $Res Function(ReportLoading) _then)
      : super(_value, (v) => _then(v as ReportLoading));

  @override
  ReportLoading get _value => super._value as ReportLoading;
}

class _$ReportLoading with DiagnosticableTreeMixin implements ReportLoading {
  const _$ReportLoading();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ReportState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'ReportState.loading'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ReportLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required Result done(@nullable String status),
    @required Result error(Exception error),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(done != null);
    assert(error != null);
    return loading();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(),
    Result done(@nullable String status),
    Result error(Exception error),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(ReportInitial value),
    @required Result loading(ReportLoading value),
    @required Result done(ReportDone value),
    @required Result error(ReportError value),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(done != null);
    assert(error != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(ReportInitial value),
    Result loading(ReportLoading value),
    Result done(ReportDone value),
    Result error(ReportError value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ReportLoading implements ReportState {
  const factory ReportLoading() = _$ReportLoading;
}

abstract class $ReportDoneCopyWith<$Res> {
  factory $ReportDoneCopyWith(
          ReportDone value, $Res Function(ReportDone) then) =
      _$ReportDoneCopyWithImpl<$Res>;
  $Res call({@nullable String status});
}

class _$ReportDoneCopyWithImpl<$Res> extends _$ReportStateCopyWithImpl<$Res>
    implements $ReportDoneCopyWith<$Res> {
  _$ReportDoneCopyWithImpl(ReportDone _value, $Res Function(ReportDone) _then)
      : super(_value, (v) => _then(v as ReportDone));

  @override
  ReportDone get _value => super._value as ReportDone;

  @override
  $Res call({
    Object status = freezed,
  }) {
    return _then(ReportDone(
      status == freezed ? _value.status : status as String,
    ));
  }
}

class _$ReportDone with DiagnosticableTreeMixin implements ReportDone {
  const _$ReportDone(@nullable this.status);

  @override
  @nullable
  final String status;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ReportState.done(status: $status)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ReportState.done'))
      ..add(DiagnosticsProperty('status', status));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ReportDone &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(status);

  @override
  $ReportDoneCopyWith<ReportDone> get copyWith =>
      _$ReportDoneCopyWithImpl<ReportDone>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required Result done(@nullable String status),
    @required Result error(Exception error),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(done != null);
    assert(error != null);
    return done(status);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(),
    Result done(@nullable String status),
    Result error(Exception error),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (done != null) {
      return done(status);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(ReportInitial value),
    @required Result loading(ReportLoading value),
    @required Result done(ReportDone value),
    @required Result error(ReportError value),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(done != null);
    assert(error != null);
    return done(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(ReportInitial value),
    Result loading(ReportLoading value),
    Result done(ReportDone value),
    Result error(ReportError value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (done != null) {
      return done(this);
    }
    return orElse();
  }
}

abstract class ReportDone implements ReportState {
  const factory ReportDone(@nullable String status) = _$ReportDone;

  @nullable
  String get status;
  $ReportDoneCopyWith<ReportDone> get copyWith;
}

abstract class $ReportErrorCopyWith<$Res> {
  factory $ReportErrorCopyWith(
          ReportError value, $Res Function(ReportError) then) =
      _$ReportErrorCopyWithImpl<$Res>;
  $Res call({Exception error});
}

class _$ReportErrorCopyWithImpl<$Res> extends _$ReportStateCopyWithImpl<$Res>
    implements $ReportErrorCopyWith<$Res> {
  _$ReportErrorCopyWithImpl(
      ReportError _value, $Res Function(ReportError) _then)
      : super(_value, (v) => _then(v as ReportError));

  @override
  ReportError get _value => super._value as ReportError;

  @override
  $Res call({
    Object error = freezed,
  }) {
    return _then(ReportError(
      error == freezed ? _value.error : error as Exception,
    ));
  }
}

class _$ReportError with DiagnosticableTreeMixin implements ReportError {
  const _$ReportError(this.error) : assert(error != null);

  @override
  final Exception error;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ReportState.error(error: $error)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ReportState.error'))
      ..add(DiagnosticsProperty('error', error));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ReportError &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(error);

  @override
  $ReportErrorCopyWith<ReportError> get copyWith =>
      _$ReportErrorCopyWithImpl<ReportError>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required Result done(@nullable String status),
    @required Result error(Exception error),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(done != null);
    assert(error != null);
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(),
    Result done(@nullable String status),
    Result error(Exception error),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(ReportInitial value),
    @required Result loading(ReportLoading value),
    @required Result done(ReportDone value),
    @required Result error(ReportError value),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(done != null);
    assert(error != null);
    return error(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(ReportInitial value),
    Result loading(ReportLoading value),
    Result done(ReportDone value),
    Result error(ReportError value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ReportError implements ReportState {
  const factory ReportError(Exception error) = _$ReportError;

  Exception get error;
  $ReportErrorCopyWith<ReportError> get copyWith;
}
