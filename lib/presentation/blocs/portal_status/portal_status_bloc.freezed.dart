// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'portal_status_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$PortalStatusEventTearOff {
  const _$PortalStatusEventTearOff();

  CalendarStatusChanged calendarStatusChanged(bool calendarIsSuccess) {
    return CalendarStatusChanged(
      calendarIsSuccess,
    );
  }

  PortalStatusChanged portalStatusChanged(bool portalIsSuccess) {
    return PortalStatusChanged(
      portalIsSuccess,
    );
  }

  PortalStatusFailureEvent failure(Exception error) {
    return PortalStatusFailureEvent(
      error,
    );
  }

  PrinterStatusChanged printerStatusChanged(bool printerIsSuccess) {
    return PrinterStatusChanged(
      printerIsSuccess,
    );
  }

  RefreshEvent refresh(String selectedUrl) {
    return RefreshEvent(
      selectedUrl,
    );
  }

  StormshieldStatusChanged stormshieldStatusChanged(
      {@required String stormshieldState,
      @required bool stormshieldIsSuccess}) {
    return StormshieldStatusChanged(
      stormshieldState: stormshieldState,
      stormshieldIsSuccess: stormshieldIsSuccess,
    );
  }
}

// ignore: unused_element
const $PortalStatusEvent = _$PortalStatusEventTearOff();

mixin _$PortalStatusEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result calendarStatusChanged(bool calendarIsSuccess),
    @required Result portalStatusChanged(bool portalIsSuccess),
    @required Result failure(Exception error),
    @required Result printerStatusChanged(bool printerIsSuccess),
    @required Result refresh(String selectedUrl),
    @required
        Result stormshieldStatusChanged(
            String stormshieldState, bool stormshieldIsSuccess),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result calendarStatusChanged(bool calendarIsSuccess),
    Result portalStatusChanged(bool portalIsSuccess),
    Result failure(Exception error),
    Result printerStatusChanged(bool printerIsSuccess),
    Result refresh(String selectedUrl),
    Result stormshieldStatusChanged(
        String stormshieldState, bool stormshieldIsSuccess),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result calendarStatusChanged(CalendarStatusChanged value),
    @required Result portalStatusChanged(PortalStatusChanged value),
    @required Result failure(PortalStatusFailureEvent value),
    @required Result printerStatusChanged(PrinterStatusChanged value),
    @required Result refresh(RefreshEvent value),
    @required Result stormshieldStatusChanged(StormshieldStatusChanged value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result calendarStatusChanged(CalendarStatusChanged value),
    Result portalStatusChanged(PortalStatusChanged value),
    Result failure(PortalStatusFailureEvent value),
    Result printerStatusChanged(PrinterStatusChanged value),
    Result refresh(RefreshEvent value),
    Result stormshieldStatusChanged(StormshieldStatusChanged value),
    @required Result orElse(),
  });
}

abstract class $PortalStatusEventCopyWith<$Res> {
  factory $PortalStatusEventCopyWith(
          PortalStatusEvent value, $Res Function(PortalStatusEvent) then) =
      _$PortalStatusEventCopyWithImpl<$Res>;
}

class _$PortalStatusEventCopyWithImpl<$Res>
    implements $PortalStatusEventCopyWith<$Res> {
  _$PortalStatusEventCopyWithImpl(this._value, this._then);

  final PortalStatusEvent _value;
  // ignore: unused_field
  final $Res Function(PortalStatusEvent) _then;
}

abstract class $CalendarStatusChangedCopyWith<$Res> {
  factory $CalendarStatusChangedCopyWith(CalendarStatusChanged value,
          $Res Function(CalendarStatusChanged) then) =
      _$CalendarStatusChangedCopyWithImpl<$Res>;
  $Res call({bool calendarIsSuccess});
}

class _$CalendarStatusChangedCopyWithImpl<$Res>
    extends _$PortalStatusEventCopyWithImpl<$Res>
    implements $CalendarStatusChangedCopyWith<$Res> {
  _$CalendarStatusChangedCopyWithImpl(
      CalendarStatusChanged _value, $Res Function(CalendarStatusChanged) _then)
      : super(_value, (v) => _then(v as CalendarStatusChanged));

  @override
  CalendarStatusChanged get _value => super._value as CalendarStatusChanged;

  @override
  $Res call({
    Object calendarIsSuccess = freezed,
  }) {
    return _then(CalendarStatusChanged(
      calendarIsSuccess == freezed
          ? _value.calendarIsSuccess
          : calendarIsSuccess as bool,
    ));
  }
}

class _$CalendarStatusChanged
    with DiagnosticableTreeMixin
    implements CalendarStatusChanged {
  const _$CalendarStatusChanged(this.calendarIsSuccess)
      : assert(calendarIsSuccess != null);

  @override
  final bool calendarIsSuccess;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PortalStatusEvent.calendarStatusChanged(calendarIsSuccess: $calendarIsSuccess)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty(
          'type', 'PortalStatusEvent.calendarStatusChanged'))
      ..add(DiagnosticsProperty('calendarIsSuccess', calendarIsSuccess));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CalendarStatusChanged &&
            (identical(other.calendarIsSuccess, calendarIsSuccess) ||
                const DeepCollectionEquality()
                    .equals(other.calendarIsSuccess, calendarIsSuccess)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(calendarIsSuccess);

  @override
  $CalendarStatusChangedCopyWith<CalendarStatusChanged> get copyWith =>
      _$CalendarStatusChangedCopyWithImpl<CalendarStatusChanged>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result calendarStatusChanged(bool calendarIsSuccess),
    @required Result portalStatusChanged(bool portalIsSuccess),
    @required Result failure(Exception error),
    @required Result printerStatusChanged(bool printerIsSuccess),
    @required Result refresh(String selectedUrl),
    @required
        Result stormshieldStatusChanged(
            String stormshieldState, bool stormshieldIsSuccess),
  }) {
    assert(calendarStatusChanged != null);
    assert(portalStatusChanged != null);
    assert(failure != null);
    assert(printerStatusChanged != null);
    assert(refresh != null);
    assert(stormshieldStatusChanged != null);
    return calendarStatusChanged(calendarIsSuccess);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result calendarStatusChanged(bool calendarIsSuccess),
    Result portalStatusChanged(bool portalIsSuccess),
    Result failure(Exception error),
    Result printerStatusChanged(bool printerIsSuccess),
    Result refresh(String selectedUrl),
    Result stormshieldStatusChanged(
        String stormshieldState, bool stormshieldIsSuccess),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (calendarStatusChanged != null) {
      return calendarStatusChanged(calendarIsSuccess);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result calendarStatusChanged(CalendarStatusChanged value),
    @required Result portalStatusChanged(PortalStatusChanged value),
    @required Result failure(PortalStatusFailureEvent value),
    @required Result printerStatusChanged(PrinterStatusChanged value),
    @required Result refresh(RefreshEvent value),
    @required Result stormshieldStatusChanged(StormshieldStatusChanged value),
  }) {
    assert(calendarStatusChanged != null);
    assert(portalStatusChanged != null);
    assert(failure != null);
    assert(printerStatusChanged != null);
    assert(refresh != null);
    assert(stormshieldStatusChanged != null);
    return calendarStatusChanged(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result calendarStatusChanged(CalendarStatusChanged value),
    Result portalStatusChanged(PortalStatusChanged value),
    Result failure(PortalStatusFailureEvent value),
    Result printerStatusChanged(PrinterStatusChanged value),
    Result refresh(RefreshEvent value),
    Result stormshieldStatusChanged(StormshieldStatusChanged value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (calendarStatusChanged != null) {
      return calendarStatusChanged(this);
    }
    return orElse();
  }
}

abstract class CalendarStatusChanged implements PortalStatusEvent {
  const factory CalendarStatusChanged(bool calendarIsSuccess) =
      _$CalendarStatusChanged;

  bool get calendarIsSuccess;
  $CalendarStatusChangedCopyWith<CalendarStatusChanged> get copyWith;
}

abstract class $PortalStatusChangedCopyWith<$Res> {
  factory $PortalStatusChangedCopyWith(
          PortalStatusChanged value, $Res Function(PortalStatusChanged) then) =
      _$PortalStatusChangedCopyWithImpl<$Res>;
  $Res call({bool portalIsSuccess});
}

class _$PortalStatusChangedCopyWithImpl<$Res>
    extends _$PortalStatusEventCopyWithImpl<$Res>
    implements $PortalStatusChangedCopyWith<$Res> {
  _$PortalStatusChangedCopyWithImpl(
      PortalStatusChanged _value, $Res Function(PortalStatusChanged) _then)
      : super(_value, (v) => _then(v as PortalStatusChanged));

  @override
  PortalStatusChanged get _value => super._value as PortalStatusChanged;

  @override
  $Res call({
    Object portalIsSuccess = freezed,
  }) {
    return _then(PortalStatusChanged(
      portalIsSuccess == freezed
          ? _value.portalIsSuccess
          : portalIsSuccess as bool,
    ));
  }
}

class _$PortalStatusChanged
    with DiagnosticableTreeMixin
    implements PortalStatusChanged {
  const _$PortalStatusChanged(this.portalIsSuccess)
      : assert(portalIsSuccess != null);

  @override
  final bool portalIsSuccess;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PortalStatusEvent.portalStatusChanged(portalIsSuccess: $portalIsSuccess)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
          DiagnosticsProperty('type', 'PortalStatusEvent.portalStatusChanged'))
      ..add(DiagnosticsProperty('portalIsSuccess', portalIsSuccess));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PortalStatusChanged &&
            (identical(other.portalIsSuccess, portalIsSuccess) ||
                const DeepCollectionEquality()
                    .equals(other.portalIsSuccess, portalIsSuccess)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(portalIsSuccess);

  @override
  $PortalStatusChangedCopyWith<PortalStatusChanged> get copyWith =>
      _$PortalStatusChangedCopyWithImpl<PortalStatusChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result calendarStatusChanged(bool calendarIsSuccess),
    @required Result portalStatusChanged(bool portalIsSuccess),
    @required Result failure(Exception error),
    @required Result printerStatusChanged(bool printerIsSuccess),
    @required Result refresh(String selectedUrl),
    @required
        Result stormshieldStatusChanged(
            String stormshieldState, bool stormshieldIsSuccess),
  }) {
    assert(calendarStatusChanged != null);
    assert(portalStatusChanged != null);
    assert(failure != null);
    assert(printerStatusChanged != null);
    assert(refresh != null);
    assert(stormshieldStatusChanged != null);
    return portalStatusChanged(portalIsSuccess);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result calendarStatusChanged(bool calendarIsSuccess),
    Result portalStatusChanged(bool portalIsSuccess),
    Result failure(Exception error),
    Result printerStatusChanged(bool printerIsSuccess),
    Result refresh(String selectedUrl),
    Result stormshieldStatusChanged(
        String stormshieldState, bool stormshieldIsSuccess),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (portalStatusChanged != null) {
      return portalStatusChanged(portalIsSuccess);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result calendarStatusChanged(CalendarStatusChanged value),
    @required Result portalStatusChanged(PortalStatusChanged value),
    @required Result failure(PortalStatusFailureEvent value),
    @required Result printerStatusChanged(PrinterStatusChanged value),
    @required Result refresh(RefreshEvent value),
    @required Result stormshieldStatusChanged(StormshieldStatusChanged value),
  }) {
    assert(calendarStatusChanged != null);
    assert(portalStatusChanged != null);
    assert(failure != null);
    assert(printerStatusChanged != null);
    assert(refresh != null);
    assert(stormshieldStatusChanged != null);
    return portalStatusChanged(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result calendarStatusChanged(CalendarStatusChanged value),
    Result portalStatusChanged(PortalStatusChanged value),
    Result failure(PortalStatusFailureEvent value),
    Result printerStatusChanged(PrinterStatusChanged value),
    Result refresh(RefreshEvent value),
    Result stormshieldStatusChanged(StormshieldStatusChanged value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (portalStatusChanged != null) {
      return portalStatusChanged(this);
    }
    return orElse();
  }
}

abstract class PortalStatusChanged implements PortalStatusEvent {
  const factory PortalStatusChanged(bool portalIsSuccess) =
      _$PortalStatusChanged;

  bool get portalIsSuccess;
  $PortalStatusChangedCopyWith<PortalStatusChanged> get copyWith;
}

abstract class $PortalStatusFailureEventCopyWith<$Res> {
  factory $PortalStatusFailureEventCopyWith(PortalStatusFailureEvent value,
          $Res Function(PortalStatusFailureEvent) then) =
      _$PortalStatusFailureEventCopyWithImpl<$Res>;
  $Res call({Exception error});
}

class _$PortalStatusFailureEventCopyWithImpl<$Res>
    extends _$PortalStatusEventCopyWithImpl<$Res>
    implements $PortalStatusFailureEventCopyWith<$Res> {
  _$PortalStatusFailureEventCopyWithImpl(PortalStatusFailureEvent _value,
      $Res Function(PortalStatusFailureEvent) _then)
      : super(_value, (v) => _then(v as PortalStatusFailureEvent));

  @override
  PortalStatusFailureEvent get _value =>
      super._value as PortalStatusFailureEvent;

  @override
  $Res call({
    Object error = freezed,
  }) {
    return _then(PortalStatusFailureEvent(
      error == freezed ? _value.error : error as Exception,
    ));
  }
}

class _$PortalStatusFailureEvent
    with DiagnosticableTreeMixin
    implements PortalStatusFailureEvent {
  const _$PortalStatusFailureEvent(this.error) : assert(error != null);

  @override
  final Exception error;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PortalStatusEvent.failure(error: $error)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PortalStatusEvent.failure'))
      ..add(DiagnosticsProperty('error', error));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PortalStatusFailureEvent &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(error);

  @override
  $PortalStatusFailureEventCopyWith<PortalStatusFailureEvent> get copyWith =>
      _$PortalStatusFailureEventCopyWithImpl<PortalStatusFailureEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result calendarStatusChanged(bool calendarIsSuccess),
    @required Result portalStatusChanged(bool portalIsSuccess),
    @required Result failure(Exception error),
    @required Result printerStatusChanged(bool printerIsSuccess),
    @required Result refresh(String selectedUrl),
    @required
        Result stormshieldStatusChanged(
            String stormshieldState, bool stormshieldIsSuccess),
  }) {
    assert(calendarStatusChanged != null);
    assert(portalStatusChanged != null);
    assert(failure != null);
    assert(printerStatusChanged != null);
    assert(refresh != null);
    assert(stormshieldStatusChanged != null);
    return failure(error);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result calendarStatusChanged(bool calendarIsSuccess),
    Result portalStatusChanged(bool portalIsSuccess),
    Result failure(Exception error),
    Result printerStatusChanged(bool printerIsSuccess),
    Result refresh(String selectedUrl),
    Result stormshieldStatusChanged(
        String stormshieldState, bool stormshieldIsSuccess),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (failure != null) {
      return failure(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result calendarStatusChanged(CalendarStatusChanged value),
    @required Result portalStatusChanged(PortalStatusChanged value),
    @required Result failure(PortalStatusFailureEvent value),
    @required Result printerStatusChanged(PrinterStatusChanged value),
    @required Result refresh(RefreshEvent value),
    @required Result stormshieldStatusChanged(StormshieldStatusChanged value),
  }) {
    assert(calendarStatusChanged != null);
    assert(portalStatusChanged != null);
    assert(failure != null);
    assert(printerStatusChanged != null);
    assert(refresh != null);
    assert(stormshieldStatusChanged != null);
    return failure(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result calendarStatusChanged(CalendarStatusChanged value),
    Result portalStatusChanged(PortalStatusChanged value),
    Result failure(PortalStatusFailureEvent value),
    Result printerStatusChanged(PrinterStatusChanged value),
    Result refresh(RefreshEvent value),
    Result stormshieldStatusChanged(StormshieldStatusChanged value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class PortalStatusFailureEvent implements PortalStatusEvent {
  const factory PortalStatusFailureEvent(Exception error) =
      _$PortalStatusFailureEvent;

  Exception get error;
  $PortalStatusFailureEventCopyWith<PortalStatusFailureEvent> get copyWith;
}

abstract class $PrinterStatusChangedCopyWith<$Res> {
  factory $PrinterStatusChangedCopyWith(PrinterStatusChanged value,
          $Res Function(PrinterStatusChanged) then) =
      _$PrinterStatusChangedCopyWithImpl<$Res>;
  $Res call({bool printerIsSuccess});
}

class _$PrinterStatusChangedCopyWithImpl<$Res>
    extends _$PortalStatusEventCopyWithImpl<$Res>
    implements $PrinterStatusChangedCopyWith<$Res> {
  _$PrinterStatusChangedCopyWithImpl(
      PrinterStatusChanged _value, $Res Function(PrinterStatusChanged) _then)
      : super(_value, (v) => _then(v as PrinterStatusChanged));

  @override
  PrinterStatusChanged get _value => super._value as PrinterStatusChanged;

  @override
  $Res call({
    Object printerIsSuccess = freezed,
  }) {
    return _then(PrinterStatusChanged(
      printerIsSuccess == freezed
          ? _value.printerIsSuccess
          : printerIsSuccess as bool,
    ));
  }
}

class _$PrinterStatusChanged
    with DiagnosticableTreeMixin
    implements PrinterStatusChanged {
  const _$PrinterStatusChanged(this.printerIsSuccess)
      : assert(printerIsSuccess != null);

  @override
  final bool printerIsSuccess;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PortalStatusEvent.printerStatusChanged(printerIsSuccess: $printerIsSuccess)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
          DiagnosticsProperty('type', 'PortalStatusEvent.printerStatusChanged'))
      ..add(DiagnosticsProperty('printerIsSuccess', printerIsSuccess));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PrinterStatusChanged &&
            (identical(other.printerIsSuccess, printerIsSuccess) ||
                const DeepCollectionEquality()
                    .equals(other.printerIsSuccess, printerIsSuccess)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(printerIsSuccess);

  @override
  $PrinterStatusChangedCopyWith<PrinterStatusChanged> get copyWith =>
      _$PrinterStatusChangedCopyWithImpl<PrinterStatusChanged>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result calendarStatusChanged(bool calendarIsSuccess),
    @required Result portalStatusChanged(bool portalIsSuccess),
    @required Result failure(Exception error),
    @required Result printerStatusChanged(bool printerIsSuccess),
    @required Result refresh(String selectedUrl),
    @required
        Result stormshieldStatusChanged(
            String stormshieldState, bool stormshieldIsSuccess),
  }) {
    assert(calendarStatusChanged != null);
    assert(portalStatusChanged != null);
    assert(failure != null);
    assert(printerStatusChanged != null);
    assert(refresh != null);
    assert(stormshieldStatusChanged != null);
    return printerStatusChanged(printerIsSuccess);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result calendarStatusChanged(bool calendarIsSuccess),
    Result portalStatusChanged(bool portalIsSuccess),
    Result failure(Exception error),
    Result printerStatusChanged(bool printerIsSuccess),
    Result refresh(String selectedUrl),
    Result stormshieldStatusChanged(
        String stormshieldState, bool stormshieldIsSuccess),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (printerStatusChanged != null) {
      return printerStatusChanged(printerIsSuccess);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result calendarStatusChanged(CalendarStatusChanged value),
    @required Result portalStatusChanged(PortalStatusChanged value),
    @required Result failure(PortalStatusFailureEvent value),
    @required Result printerStatusChanged(PrinterStatusChanged value),
    @required Result refresh(RefreshEvent value),
    @required Result stormshieldStatusChanged(StormshieldStatusChanged value),
  }) {
    assert(calendarStatusChanged != null);
    assert(portalStatusChanged != null);
    assert(failure != null);
    assert(printerStatusChanged != null);
    assert(refresh != null);
    assert(stormshieldStatusChanged != null);
    return printerStatusChanged(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result calendarStatusChanged(CalendarStatusChanged value),
    Result portalStatusChanged(PortalStatusChanged value),
    Result failure(PortalStatusFailureEvent value),
    Result printerStatusChanged(PrinterStatusChanged value),
    Result refresh(RefreshEvent value),
    Result stormshieldStatusChanged(StormshieldStatusChanged value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (printerStatusChanged != null) {
      return printerStatusChanged(this);
    }
    return orElse();
  }
}

abstract class PrinterStatusChanged implements PortalStatusEvent {
  const factory PrinterStatusChanged(bool printerIsSuccess) =
      _$PrinterStatusChanged;

  bool get printerIsSuccess;
  $PrinterStatusChangedCopyWith<PrinterStatusChanged> get copyWith;
}

abstract class $RefreshEventCopyWith<$Res> {
  factory $RefreshEventCopyWith(
          RefreshEvent value, $Res Function(RefreshEvent) then) =
      _$RefreshEventCopyWithImpl<$Res>;
  $Res call({String selectedUrl});
}

class _$RefreshEventCopyWithImpl<$Res>
    extends _$PortalStatusEventCopyWithImpl<$Res>
    implements $RefreshEventCopyWith<$Res> {
  _$RefreshEventCopyWithImpl(
      RefreshEvent _value, $Res Function(RefreshEvent) _then)
      : super(_value, (v) => _then(v as RefreshEvent));

  @override
  RefreshEvent get _value => super._value as RefreshEvent;

  @override
  $Res call({
    Object selectedUrl = freezed,
  }) {
    return _then(RefreshEvent(
      selectedUrl == freezed ? _value.selectedUrl : selectedUrl as String,
    ));
  }
}

class _$RefreshEvent with DiagnosticableTreeMixin implements RefreshEvent {
  const _$RefreshEvent(this.selectedUrl) : assert(selectedUrl != null);

  @override
  final String selectedUrl;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PortalStatusEvent.refresh(selectedUrl: $selectedUrl)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PortalStatusEvent.refresh'))
      ..add(DiagnosticsProperty('selectedUrl', selectedUrl));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is RefreshEvent &&
            (identical(other.selectedUrl, selectedUrl) ||
                const DeepCollectionEquality()
                    .equals(other.selectedUrl, selectedUrl)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(selectedUrl);

  @override
  $RefreshEventCopyWith<RefreshEvent> get copyWith =>
      _$RefreshEventCopyWithImpl<RefreshEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result calendarStatusChanged(bool calendarIsSuccess),
    @required Result portalStatusChanged(bool portalIsSuccess),
    @required Result failure(Exception error),
    @required Result printerStatusChanged(bool printerIsSuccess),
    @required Result refresh(String selectedUrl),
    @required
        Result stormshieldStatusChanged(
            String stormshieldState, bool stormshieldIsSuccess),
  }) {
    assert(calendarStatusChanged != null);
    assert(portalStatusChanged != null);
    assert(failure != null);
    assert(printerStatusChanged != null);
    assert(refresh != null);
    assert(stormshieldStatusChanged != null);
    return refresh(selectedUrl);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result calendarStatusChanged(bool calendarIsSuccess),
    Result portalStatusChanged(bool portalIsSuccess),
    Result failure(Exception error),
    Result printerStatusChanged(bool printerIsSuccess),
    Result refresh(String selectedUrl),
    Result stormshieldStatusChanged(
        String stormshieldState, bool stormshieldIsSuccess),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (refresh != null) {
      return refresh(selectedUrl);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result calendarStatusChanged(CalendarStatusChanged value),
    @required Result portalStatusChanged(PortalStatusChanged value),
    @required Result failure(PortalStatusFailureEvent value),
    @required Result printerStatusChanged(PrinterStatusChanged value),
    @required Result refresh(RefreshEvent value),
    @required Result stormshieldStatusChanged(StormshieldStatusChanged value),
  }) {
    assert(calendarStatusChanged != null);
    assert(portalStatusChanged != null);
    assert(failure != null);
    assert(printerStatusChanged != null);
    assert(refresh != null);
    assert(stormshieldStatusChanged != null);
    return refresh(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result calendarStatusChanged(CalendarStatusChanged value),
    Result portalStatusChanged(PortalStatusChanged value),
    Result failure(PortalStatusFailureEvent value),
    Result printerStatusChanged(PrinterStatusChanged value),
    Result refresh(RefreshEvent value),
    Result stormshieldStatusChanged(StormshieldStatusChanged value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (refresh != null) {
      return refresh(this);
    }
    return orElse();
  }
}

abstract class RefreshEvent implements PortalStatusEvent {
  const factory RefreshEvent(String selectedUrl) = _$RefreshEvent;

  String get selectedUrl;
  $RefreshEventCopyWith<RefreshEvent> get copyWith;
}

abstract class $StormshieldStatusChangedCopyWith<$Res> {
  factory $StormshieldStatusChangedCopyWith(StormshieldStatusChanged value,
          $Res Function(StormshieldStatusChanged) then) =
      _$StormshieldStatusChangedCopyWithImpl<$Res>;
  $Res call({String stormshieldState, bool stormshieldIsSuccess});
}

class _$StormshieldStatusChangedCopyWithImpl<$Res>
    extends _$PortalStatusEventCopyWithImpl<$Res>
    implements $StormshieldStatusChangedCopyWith<$Res> {
  _$StormshieldStatusChangedCopyWithImpl(StormshieldStatusChanged _value,
      $Res Function(StormshieldStatusChanged) _then)
      : super(_value, (v) => _then(v as StormshieldStatusChanged));

  @override
  StormshieldStatusChanged get _value =>
      super._value as StormshieldStatusChanged;

  @override
  $Res call({
    Object stormshieldState = freezed,
    Object stormshieldIsSuccess = freezed,
  }) {
    return _then(StormshieldStatusChanged(
      stormshieldState: stormshieldState == freezed
          ? _value.stormshieldState
          : stormshieldState as String,
      stormshieldIsSuccess: stormshieldIsSuccess == freezed
          ? _value.stormshieldIsSuccess
          : stormshieldIsSuccess as bool,
    ));
  }
}

class _$StormshieldStatusChanged
    with DiagnosticableTreeMixin
    implements StormshieldStatusChanged {
  const _$StormshieldStatusChanged(
      {@required this.stormshieldState, @required this.stormshieldIsSuccess})
      : assert(stormshieldState != null),
        assert(stormshieldIsSuccess != null);

  @override
  final String stormshieldState;
  @override
  final bool stormshieldIsSuccess;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PortalStatusEvent.stormshieldStatusChanged(stormshieldState: $stormshieldState, stormshieldIsSuccess: $stormshieldIsSuccess)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty(
          'type', 'PortalStatusEvent.stormshieldStatusChanged'))
      ..add(DiagnosticsProperty('stormshieldState', stormshieldState))
      ..add(DiagnosticsProperty('stormshieldIsSuccess', stormshieldIsSuccess));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is StormshieldStatusChanged &&
            (identical(other.stormshieldState, stormshieldState) ||
                const DeepCollectionEquality()
                    .equals(other.stormshieldState, stormshieldState)) &&
            (identical(other.stormshieldIsSuccess, stormshieldIsSuccess) ||
                const DeepCollectionEquality()
                    .equals(other.stormshieldIsSuccess, stormshieldIsSuccess)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(stormshieldState) ^
      const DeepCollectionEquality().hash(stormshieldIsSuccess);

  @override
  $StormshieldStatusChangedCopyWith<StormshieldStatusChanged> get copyWith =>
      _$StormshieldStatusChangedCopyWithImpl<StormshieldStatusChanged>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result calendarStatusChanged(bool calendarIsSuccess),
    @required Result portalStatusChanged(bool portalIsSuccess),
    @required Result failure(Exception error),
    @required Result printerStatusChanged(bool printerIsSuccess),
    @required Result refresh(String selectedUrl),
    @required
        Result stormshieldStatusChanged(
            String stormshieldState, bool stormshieldIsSuccess),
  }) {
    assert(calendarStatusChanged != null);
    assert(portalStatusChanged != null);
    assert(failure != null);
    assert(printerStatusChanged != null);
    assert(refresh != null);
    assert(stormshieldStatusChanged != null);
    return stormshieldStatusChanged(stormshieldState, stormshieldIsSuccess);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result calendarStatusChanged(bool calendarIsSuccess),
    Result portalStatusChanged(bool portalIsSuccess),
    Result failure(Exception error),
    Result printerStatusChanged(bool printerIsSuccess),
    Result refresh(String selectedUrl),
    Result stormshieldStatusChanged(
        String stormshieldState, bool stormshieldIsSuccess),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (stormshieldStatusChanged != null) {
      return stormshieldStatusChanged(stormshieldState, stormshieldIsSuccess);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result calendarStatusChanged(CalendarStatusChanged value),
    @required Result portalStatusChanged(PortalStatusChanged value),
    @required Result failure(PortalStatusFailureEvent value),
    @required Result printerStatusChanged(PrinterStatusChanged value),
    @required Result refresh(RefreshEvent value),
    @required Result stormshieldStatusChanged(StormshieldStatusChanged value),
  }) {
    assert(calendarStatusChanged != null);
    assert(portalStatusChanged != null);
    assert(failure != null);
    assert(printerStatusChanged != null);
    assert(refresh != null);
    assert(stormshieldStatusChanged != null);
    return stormshieldStatusChanged(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result calendarStatusChanged(CalendarStatusChanged value),
    Result portalStatusChanged(PortalStatusChanged value),
    Result failure(PortalStatusFailureEvent value),
    Result printerStatusChanged(PrinterStatusChanged value),
    Result refresh(RefreshEvent value),
    Result stormshieldStatusChanged(StormshieldStatusChanged value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (stormshieldStatusChanged != null) {
      return stormshieldStatusChanged(this);
    }
    return orElse();
  }
}

abstract class StormshieldStatusChanged implements PortalStatusEvent {
  const factory StormshieldStatusChanged(
      {@required String stormshieldState,
      @required bool stormshieldIsSuccess}) = _$StormshieldStatusChanged;

  String get stormshieldState;
  bool get stormshieldIsSuccess;
  $StormshieldStatusChangedCopyWith<StormshieldStatusChanged> get copyWith;
}

class _$PortalStatusStateTearOff {
  const _$PortalStatusStateTearOff();

  _PortalStatusState call(
      {@required bool calendarIsSuccess,
      @required bool portalIsSuccess,
      @required bool printerIsSuccess,
      @required String stormshieldState,
      @required bool stormshieldIsSuccess,
      @required bool isFetching,
      @required bool isFailure,
      Exception error}) {
    return _PortalStatusState(
      calendarIsSuccess: calendarIsSuccess,
      portalIsSuccess: portalIsSuccess,
      printerIsSuccess: printerIsSuccess,
      stormshieldState: stormshieldState,
      stormshieldIsSuccess: stormshieldIsSuccess,
      isFetching: isFetching,
      isFailure: isFailure,
      error: error,
    );
  }
}

// ignore: unused_element
const $PortalStatusState = _$PortalStatusStateTearOff();

mixin _$PortalStatusState {
  bool get calendarIsSuccess;
  bool get portalIsSuccess;
  bool get printerIsSuccess;
  String get stormshieldState;
  bool get stormshieldIsSuccess;
  bool get isFetching;
  bool get isFailure;
  Exception get error;

  $PortalStatusStateCopyWith<PortalStatusState> get copyWith;
}

abstract class $PortalStatusStateCopyWith<$Res> {
  factory $PortalStatusStateCopyWith(
          PortalStatusState value, $Res Function(PortalStatusState) then) =
      _$PortalStatusStateCopyWithImpl<$Res>;
  $Res call(
      {bool calendarIsSuccess,
      bool portalIsSuccess,
      bool printerIsSuccess,
      String stormshieldState,
      bool stormshieldIsSuccess,
      bool isFetching,
      bool isFailure,
      Exception error});
}

class _$PortalStatusStateCopyWithImpl<$Res>
    implements $PortalStatusStateCopyWith<$Res> {
  _$PortalStatusStateCopyWithImpl(this._value, this._then);

  final PortalStatusState _value;
  // ignore: unused_field
  final $Res Function(PortalStatusState) _then;

  @override
  $Res call({
    Object calendarIsSuccess = freezed,
    Object portalIsSuccess = freezed,
    Object printerIsSuccess = freezed,
    Object stormshieldState = freezed,
    Object stormshieldIsSuccess = freezed,
    Object isFetching = freezed,
    Object isFailure = freezed,
    Object error = freezed,
  }) {
    return _then(_value.copyWith(
      calendarIsSuccess: calendarIsSuccess == freezed
          ? _value.calendarIsSuccess
          : calendarIsSuccess as bool,
      portalIsSuccess: portalIsSuccess == freezed
          ? _value.portalIsSuccess
          : portalIsSuccess as bool,
      printerIsSuccess: printerIsSuccess == freezed
          ? _value.printerIsSuccess
          : printerIsSuccess as bool,
      stormshieldState: stormshieldState == freezed
          ? _value.stormshieldState
          : stormshieldState as String,
      stormshieldIsSuccess: stormshieldIsSuccess == freezed
          ? _value.stormshieldIsSuccess
          : stormshieldIsSuccess as bool,
      isFetching:
          isFetching == freezed ? _value.isFetching : isFetching as bool,
      isFailure: isFailure == freezed ? _value.isFailure : isFailure as bool,
      error: error == freezed ? _value.error : error as Exception,
    ));
  }
}

abstract class _$PortalStatusStateCopyWith<$Res>
    implements $PortalStatusStateCopyWith<$Res> {
  factory _$PortalStatusStateCopyWith(
          _PortalStatusState value, $Res Function(_PortalStatusState) then) =
      __$PortalStatusStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool calendarIsSuccess,
      bool portalIsSuccess,
      bool printerIsSuccess,
      String stormshieldState,
      bool stormshieldIsSuccess,
      bool isFetching,
      bool isFailure,
      Exception error});
}

class __$PortalStatusStateCopyWithImpl<$Res>
    extends _$PortalStatusStateCopyWithImpl<$Res>
    implements _$PortalStatusStateCopyWith<$Res> {
  __$PortalStatusStateCopyWithImpl(
      _PortalStatusState _value, $Res Function(_PortalStatusState) _then)
      : super(_value, (v) => _then(v as _PortalStatusState));

  @override
  _PortalStatusState get _value => super._value as _PortalStatusState;

  @override
  $Res call({
    Object calendarIsSuccess = freezed,
    Object portalIsSuccess = freezed,
    Object printerIsSuccess = freezed,
    Object stormshieldState = freezed,
    Object stormshieldIsSuccess = freezed,
    Object isFetching = freezed,
    Object isFailure = freezed,
    Object error = freezed,
  }) {
    return _then(_PortalStatusState(
      calendarIsSuccess: calendarIsSuccess == freezed
          ? _value.calendarIsSuccess
          : calendarIsSuccess as bool,
      portalIsSuccess: portalIsSuccess == freezed
          ? _value.portalIsSuccess
          : portalIsSuccess as bool,
      printerIsSuccess: printerIsSuccess == freezed
          ? _value.printerIsSuccess
          : printerIsSuccess as bool,
      stormshieldState: stormshieldState == freezed
          ? _value.stormshieldState
          : stormshieldState as String,
      stormshieldIsSuccess: stormshieldIsSuccess == freezed
          ? _value.stormshieldIsSuccess
          : stormshieldIsSuccess as bool,
      isFetching:
          isFetching == freezed ? _value.isFetching : isFetching as bool,
      isFailure: isFailure == freezed ? _value.isFailure : isFailure as bool,
      error: error == freezed ? _value.error : error as Exception,
    ));
  }
}

class _$_PortalStatusState
    with DiagnosticableTreeMixin
    implements _PortalStatusState {
  const _$_PortalStatusState(
      {@required this.calendarIsSuccess,
      @required this.portalIsSuccess,
      @required this.printerIsSuccess,
      @required this.stormshieldState,
      @required this.stormshieldIsSuccess,
      @required this.isFetching,
      @required this.isFailure,
      this.error})
      : assert(calendarIsSuccess != null),
        assert(portalIsSuccess != null),
        assert(printerIsSuccess != null),
        assert(stormshieldState != null),
        assert(stormshieldIsSuccess != null),
        assert(isFetching != null),
        assert(isFailure != null);

  @override
  final bool calendarIsSuccess;
  @override
  final bool portalIsSuccess;
  @override
  final bool printerIsSuccess;
  @override
  final String stormshieldState;
  @override
  final bool stormshieldIsSuccess;
  @override
  final bool isFetching;
  @override
  final bool isFailure;
  @override
  final Exception error;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PortalStatusState(calendarIsSuccess: $calendarIsSuccess, portalIsSuccess: $portalIsSuccess, printerIsSuccess: $printerIsSuccess, stormshieldState: $stormshieldState, stormshieldIsSuccess: $stormshieldIsSuccess, isFetching: $isFetching, isFailure: $isFailure, error: $error)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PortalStatusState'))
      ..add(DiagnosticsProperty('calendarIsSuccess', calendarIsSuccess))
      ..add(DiagnosticsProperty('portalIsSuccess', portalIsSuccess))
      ..add(DiagnosticsProperty('printerIsSuccess', printerIsSuccess))
      ..add(DiagnosticsProperty('stormshieldState', stormshieldState))
      ..add(DiagnosticsProperty('stormshieldIsSuccess', stormshieldIsSuccess))
      ..add(DiagnosticsProperty('isFetching', isFetching))
      ..add(DiagnosticsProperty('isFailure', isFailure))
      ..add(DiagnosticsProperty('error', error));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PortalStatusState &&
            (identical(other.calendarIsSuccess, calendarIsSuccess) ||
                const DeepCollectionEquality()
                    .equals(other.calendarIsSuccess, calendarIsSuccess)) &&
            (identical(other.portalIsSuccess, portalIsSuccess) ||
                const DeepCollectionEquality()
                    .equals(other.portalIsSuccess, portalIsSuccess)) &&
            (identical(other.printerIsSuccess, printerIsSuccess) ||
                const DeepCollectionEquality()
                    .equals(other.printerIsSuccess, printerIsSuccess)) &&
            (identical(other.stormshieldState, stormshieldState) ||
                const DeepCollectionEquality()
                    .equals(other.stormshieldState, stormshieldState)) &&
            (identical(other.stormshieldIsSuccess, stormshieldIsSuccess) ||
                const DeepCollectionEquality().equals(
                    other.stormshieldIsSuccess, stormshieldIsSuccess)) &&
            (identical(other.isFetching, isFetching) ||
                const DeepCollectionEquality()
                    .equals(other.isFetching, isFetching)) &&
            (identical(other.isFailure, isFailure) ||
                const DeepCollectionEquality()
                    .equals(other.isFailure, isFailure)) &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(calendarIsSuccess) ^
      const DeepCollectionEquality().hash(portalIsSuccess) ^
      const DeepCollectionEquality().hash(printerIsSuccess) ^
      const DeepCollectionEquality().hash(stormshieldState) ^
      const DeepCollectionEquality().hash(stormshieldIsSuccess) ^
      const DeepCollectionEquality().hash(isFetching) ^
      const DeepCollectionEquality().hash(isFailure) ^
      const DeepCollectionEquality().hash(error);

  @override
  _$PortalStatusStateCopyWith<_PortalStatusState> get copyWith =>
      __$PortalStatusStateCopyWithImpl<_PortalStatusState>(this, _$identity);
}

abstract class _PortalStatusState implements PortalStatusState {
  const factory _PortalStatusState(
      {@required bool calendarIsSuccess,
      @required bool portalIsSuccess,
      @required bool printerIsSuccess,
      @required String stormshieldState,
      @required bool stormshieldIsSuccess,
      @required bool isFetching,
      @required bool isFailure,
      Exception error}) = _$_PortalStatusState;

  @override
  bool get calendarIsSuccess;
  @override
  bool get portalIsSuccess;
  @override
  bool get printerIsSuccess;
  @override
  String get stormshieldState;
  @override
  bool get stormshieldIsSuccess;
  @override
  bool get isFetching;
  @override
  bool get isFailure;
  @override
  Exception get error;
  @override
  _$PortalStatusStateCopyWith<_PortalStatusState> get copyWith;
}
