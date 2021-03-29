// Mocks generated by Mockito 5.0.3 from annotations
// in minitel_toolbox/test/domain/entities/icalendar/event_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:flutter_local_notifications/src/flutter_local_notifications_plugin.dart'
    as _i3;
import 'package:flutter_local_notifications/src/initialization_settings.dart'
    as _i5;
import 'package:flutter_local_notifications/src/notification_details.dart'
    as _i7;
import 'package:flutter_local_notifications/src/platform_specifics/ios/enums.dart'
    as _i9;
import 'package:flutter_local_notifications/src/typedefs.dart' as _i6;
import 'package:flutter_local_notifications/src/types.dart' as _i10;
import 'package:flutter_local_notifications_platform_interface/src/notification_app_launch_details.dart'
    as _i2;
import 'package:flutter_local_notifications_platform_interface/src/types.dart'
    as _i11;
import 'package:mockito/mockito.dart' as _i1;
import 'package:timezone/src/date_time.dart' as _i8;

// ignore_for_file: comment_references
// ignore_for_file: unnecessary_parenthesis

class _FakeNotificationAppLaunchDetails extends _i1.Fake
    implements _i2.NotificationAppLaunchDetails {}

/// A class which mocks [FlutterLocalNotificationsPlugin].
///
/// See the documentation for Mockito's code generation for more information.
class MockFlutterLocalNotificationsPlugin extends _i1.Mock
    implements _i3.FlutterLocalNotificationsPlugin {
  MockFlutterLocalNotificationsPlugin() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<bool?> initialize(
          _i5.InitializationSettings? initializationSettings,
          {_i6.SelectNotificationCallback? onSelectNotification}) =>
      (super.noSuchMethod(
          Invocation.method(#initialize, [initializationSettings],
              {#onSelectNotification: onSelectNotification}),
          returnValue: Future.value(false)) as _i4.Future<bool?>);
  @override
  _i4.Future<_i2.NotificationAppLaunchDetails?>
      getNotificationAppLaunchDetails() => (super.noSuchMethod(
              Invocation.method(#getNotificationAppLaunchDetails, []),
              returnValue: Future.value(_FakeNotificationAppLaunchDetails()))
          as _i4.Future<_i2.NotificationAppLaunchDetails?>);
  @override
  _i4.Future<void> show(int? id, String? title, String? body,
          _i7.NotificationDetails? notificationDetails, {String? payload}) =>
      (super.noSuchMethod(
          Invocation.method(#show, [id, title, body, notificationDetails],
              {#payload: payload}),
          returnValue: Future.value(null),
          returnValueForMissingStub: Future.value()) as _i4.Future<void>);
  @override
  _i4.Future<void> cancel(int? id, {String? tag}) =>
      (super.noSuchMethod(Invocation.method(#cancel, [id], {#tag: tag}),
          returnValue: Future.value(null),
          returnValueForMissingStub: Future.value()) as _i4.Future<void>);
  @override
  _i4.Future<void> cancelAll() =>
      (super.noSuchMethod(Invocation.method(#cancelAll, []),
          returnValue: Future.value(null),
          returnValueForMissingStub: Future.value()) as _i4.Future<void>);
  @override
  _i4.Future<void> schedule(int? id, String? title, String? body,
          DateTime? scheduledDate, _i7.NotificationDetails? notificationDetails,
          {String? payload, bool? androidAllowWhileIdle = false}) =>
      (super.noSuchMethod(
          Invocation.method(#schedule, [
            id,
            title,
            body,
            scheduledDate,
            notificationDetails
          ], {
            #payload: payload,
            #androidAllowWhileIdle: androidAllowWhileIdle
          }),
          returnValue: Future.value(null),
          returnValueForMissingStub: Future.value()) as _i4.Future<void>);
  @override
  _i4.Future<void> zonedSchedule(
          int? id,
          String? title,
          String? body,
          _i8.TZDateTime? scheduledDate,
          _i7.NotificationDetails? notificationDetails,
          {_i9.UILocalNotificationDateInterpretation?
              uiLocalNotificationDateInterpretation,
          bool? androidAllowWhileIdle,
          String? payload,
          _i10.DateTimeComponents? matchDateTimeComponents}) =>
      (super.noSuchMethod(
          Invocation.method(#zonedSchedule, [
            id,
            title,
            body,
            scheduledDate,
            notificationDetails
          ], {
            #uiLocalNotificationDateInterpretation:
                uiLocalNotificationDateInterpretation,
            #androidAllowWhileIdle: androidAllowWhileIdle,
            #payload: payload,
            #matchDateTimeComponents: matchDateTimeComponents
          }),
          returnValue: Future.value(null),
          returnValueForMissingStub: Future.value()) as _i4.Future<void>);
  @override
  _i4.Future<void> periodicallyShow(
          int? id,
          String? title,
          String? body,
          _i11.RepeatInterval? repeatInterval,
          _i7.NotificationDetails? notificationDetails,
          {String? payload,
          bool? androidAllowWhileIdle = false}) =>
      (super.noSuchMethod(
          Invocation.method(#periodicallyShow, [
            id,
            title,
            body,
            repeatInterval,
            notificationDetails
          ], {
            #payload: payload,
            #androidAllowWhileIdle: androidAllowWhileIdle
          }),
          returnValue: Future.value(null),
          returnValueForMissingStub: Future.value()) as _i4.Future<void>);
  @override
  _i4.Future<void> showDailyAtTime(
          int? id,
          String? title,
          String? body,
          _i10.Time? notificationTime,
          _i7.NotificationDetails? notificationDetails,
          {String? payload}) =>
      (super.noSuchMethod(
          Invocation.method(
              #showDailyAtTime,
              [id, title, body, notificationTime, notificationDetails],
              {#payload: payload}),
          returnValue: Future.value(null),
          returnValueForMissingStub: Future.value()) as _i4.Future<void>);
  @override
  _i4.Future<void> showWeeklyAtDayAndTime(
          int? id,
          String? title,
          String? body,
          _i10.Day? day,
          _i10.Time? notificationTime,
          _i7.NotificationDetails? notificationDetails,
          {String? payload}) =>
      (super.noSuchMethod(
          Invocation.method(
              #showWeeklyAtDayAndTime,
              [id, title, body, day, notificationTime, notificationDetails],
              {#payload: payload}),
          returnValue: Future.value(null),
          returnValueForMissingStub: Future.value()) as _i4.Future<void>);
  @override
  _i4.Future<List<_i11.PendingNotificationRequest>>
      pendingNotificationRequests() => (super.noSuchMethod(
              Invocation.method(#pendingNotificationRequests, []),
              returnValue: Future.value(<_i11.PendingNotificationRequest>[]))
          as _i4.Future<List<_i11.PendingNotificationRequest>>);
}

/// A class which mocks [NotificationDetails].
///
/// See the documentation for Mockito's code generation for more information.
class MockNotificationDetails extends _i1.Mock
    implements _i7.NotificationDetails {
  MockNotificationDetails() {
    _i1.throwOnMissingStub(this);
  }
}