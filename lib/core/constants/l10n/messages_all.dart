// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that looks up messages for specific locales by
// delegating to the appropriate library.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:implementation_imports

import 'dart:async';

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';
import 'package:intl/src/intl_helpers.dart';

import 'messages_en.dart' as messages_en;
import 'messages_fr.dart' as messages_fr;
import 'messages_it.dart' as messages_it;
import 'messages_messages.dart' as messages_messages;

Map<String, LibraryLoader> _deferredLibraries = <String, LibraryLoader>{
  'messages': () => Future<void>.value(null),
  'en': () => Future<void>.value(null),
  'fr': () => Future<void>.value(null),
  'it': () => Future<void>.value(null),
};

/// User programs should call this before using [localeName] for messages.
Future<bool> initializeMessages(String localeName) async {
  final String availableLocale = Intl.verifiedLocale(
      localeName, (String locale) => _deferredLibraries[locale] != null,
      onFailure: (_) => null);
  if (availableLocale == null) {
    return Future<bool>.value(false);
  }
  final LibraryLoader lib = _deferredLibraries[availableLocale];
  await (lib == null ? Future<bool>.value(false) : lib());
  initializeInternalMessageLookup(() => CompositeMessageLookup());
  messageLookup.addLocale(availableLocale, _findGeneratedMessagesFor);
  return Future<bool>.value(true);
}

MessageLookupByLibrary _findExact(String localeName) {
  switch (localeName) {
    case 'messages':
      return messages_messages.messages;
    case 'en':
      return messages_en.messages;
    case 'fr':
      return messages_fr.messages;
    case 'it':
      return messages_it.messages;
    default:
      return null;
  }
}

MessageLookupByLibrary _findGeneratedMessagesFor(String locale) {
  final String actualLocale =
      Intl.verifiedLocale(locale, _messagesExistFor, onFailure: (_) => null);
  if (actualLocale == null) {
    return null;
  }
  return _findExact(actualLocale);
}

bool _messagesExistFor(String locale) {
  try {
    return _findExact(locale) != null;
  } catch (e) {
    return false;
  }
}

typedef LibraryLoader = Future<dynamic> Function();
