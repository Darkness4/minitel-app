// Mocks generated by Mockito 5.0.3 from annotations
// in minitel_toolbox/test/data/repositories/calendar_url_repository_impl_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i3;

import 'package:connectivity_platform_interface/src/enums.dart' as _i4;
import 'package:minitel_toolbox/core/network/network_info.dart' as _i2;
import 'package:minitel_toolbox/data/datasources/calendar_url/calendar_url_local_data_source.dart'
    as _i6;
import 'package:minitel_toolbox/data/datasources/calendar_url/calendar_url_remote_data_source.dart'
    as _i5;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: comment_references
// ignore_for_file: unnecessary_parenthesis

/// A class which mocks [NetworkInfo].
///
/// See the documentation for Mockito's code generation for more information.
class MockNetworkInfo extends _i1.Mock implements _i2.NetworkInfo {
  MockNetworkInfo() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<_i4.ConnectivityResult> get result =>
      (super.noSuchMethod(Invocation.getter(#result),
              returnValue: Future.value(_i4.ConnectivityResult.wifi))
          as _i3.Future<_i4.ConnectivityResult>);
}

/// A class which mocks [CalendarURLRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockRemoteDataSource extends _i1.Mock
    implements _i5.CalendarURLRemoteDataSource {
  MockRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<String> getCalendarURL({String? username, String? password}) =>
      (super.noSuchMethod(
          Invocation.method(
              #getCalendarURL, [], {#username: username, #password: password}),
          returnValue: Future.value('')) as _i3.Future<String>);
}

/// A class which mocks [CalendarURLLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockLocalDataSource extends _i1.Mock
    implements _i6.CalendarURLLocalDataSource {
  MockLocalDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<String> getLastCalendarURL() =>
      (super.noSuchMethod(Invocation.method(#getLastCalendarURL, []),
          returnValue: Future.value('')) as _i3.Future<String>);
  @override
  _i3.Future<void> saveCalendarURL(String? url) =>
      (super.noSuchMethod(Invocation.method(#saveCalendarURL, [url]),
          returnValue: Future.value(null),
          returnValueForMissingStub: Future.value()) as _i3.Future<void>);
}
