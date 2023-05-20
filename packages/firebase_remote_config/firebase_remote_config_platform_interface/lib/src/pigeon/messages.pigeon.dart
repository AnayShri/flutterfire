// Copyright 2023, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.
// Autogenerated from Pigeon (v9.2.5), do not edit directly.
// See also: https://pub.dev/packages/pigeon
// ignore_for_file: public_member_api_docs, non_constant_identifier_names, avoid_as, unused_import, unnecessary_parenthesis, prefer_null_aware_operators, omit_local_variable_types, unused_shown_name, unnecessary_import

import 'dart:async';
import 'dart:typed_data' show Float64List, Int32List, Int64List, Uint8List;

import 'package:flutter/foundation.dart' show ReadBuffer, WriteBuffer;
import 'package:flutter/services.dart';

/// ValueSource defines the possible sources of a config parameter value.
enum PigeonValueSource {
  /// The value was defined by a static constant.
  valueStatic,
  /// The value was defined by default config.
  valueDefault,
  /// The value was defined by fetched config.
  valueRemote,
}

enum PigeonRemoteConfigFetchStatus {
  /// Indicates instance has not yet attempted a fetch.
  noFetchYet,
  /// Indicates the last fetch attempt succeeded.
  success,
  /// Indicates the last fetch attempt failed.
  failure,
  /// Indicates the last fetch attempt was rate-limited.
  throttle,
}

class PigeonRemoteConfigSettings {
  PigeonRemoteConfigSettings({
    required this.fetchTimeout,
    required this.minimumFetchInterval,
  });

  int fetchTimeout;

  int minimumFetchInterval;

  Object encode() {
    return <Object?>[
      fetchTimeout,
      minimumFetchInterval,
    ];
  }

  static PigeonRemoteConfigSettings decode(Object result) {
    result as List<Object?>;
    return PigeonRemoteConfigSettings(
      fetchTimeout: result[0]! as int,
      minimumFetchInterval: result[1]! as int,
    );
  }
}

class PigeonRemoteConfigValue {
  PigeonRemoteConfigValue({
    this.value,
    required this.source,
  });

  List<int?>? value;

  /// Indicates at which source this value came from.
  PigeonValueSource source;

  Object encode() {
    return <Object?>[
      value,
      source.index,
    ];
  }

  static PigeonRemoteConfigValue decode(Object result) {
    result as List<Object?>;
    return PigeonRemoteConfigValue(
      value: (result[0] as List<Object?>?)?.cast<int?>(),
      source: PigeonValueSource.values[result[1]! as int],
    );
  }
}

class PigeonFirebaseApp {
  PigeonFirebaseApp({
    required this.appName,
    this.tenantId,
  });

  String appName;

  String? tenantId;

  Object encode() {
    return <Object?>[
      appName,
      tenantId,
    ];
  }

  static PigeonFirebaseApp decode(Object result) {
    result as List<Object?>;
    return PigeonFirebaseApp(
      appName: result[0]! as String,
      tenantId: result[1] as String?,
    );
  }
}

class _FirebaseRemoteConfigHostApiCodec extends StandardMessageCodec {
  const _FirebaseRemoteConfigHostApiCodec();
  @override
  void writeValue(WriteBuffer buffer, Object? value) {
    if (value is PigeonFirebaseApp) {
      buffer.putUint8(128);
      writeValue(buffer, value.encode());
    } else if (value is PigeonRemoteConfigSettings) {
      buffer.putUint8(129);
      writeValue(buffer, value.encode());
    } else if (value is PigeonRemoteConfigValue) {
      buffer.putUint8(130);
      writeValue(buffer, value.encode());
    } else {
      super.writeValue(buffer, value);
    }
  }

  @override
  Object? readValueOfType(int type, ReadBuffer buffer) {
    switch (type) {
      case 128: 
        return PigeonFirebaseApp.decode(readValue(buffer)!);
      case 129: 
        return PigeonRemoteConfigSettings.decode(readValue(buffer)!);
      case 130: 
        return PigeonRemoteConfigValue.decode(readValue(buffer)!);
      default:
        return super.readValueOfType(type, buffer);
    }
  }
}

class FirebaseRemoteConfigHostApi {
  /// Constructor for [FirebaseRemoteConfigHostApi].  The [binaryMessenger] named argument is
  /// available for dependency injection.  If it is left null, the default
  /// BinaryMessenger will be used which routes to the host platform.
  FirebaseRemoteConfigHostApi({BinaryMessenger? binaryMessenger})
      : _binaryMessenger = binaryMessenger;
  final BinaryMessenger? _binaryMessenger;

  static const MessageCodec<Object?> codec = _FirebaseRemoteConfigHostApiCodec();

  Future<bool> activate(PigeonFirebaseApp arg_app) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.FirebaseRemoteConfigHostApi.activate', codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_app]) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else if (replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (replyList[0] as bool?)!;
    }
  }

  Future<void> ensureInitialized(PigeonFirebaseApp arg_app) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.FirebaseRemoteConfigHostApi.ensureInitialized', codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_app]) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return;
    }
  }

  Future<void> fetch(PigeonFirebaseApp arg_app) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.FirebaseRemoteConfigHostApi.fetch', codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_app]) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return;
    }
  }

  Future<bool> fetchAndActivate(PigeonFirebaseApp arg_app) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.FirebaseRemoteConfigHostApi.fetchAndActivate', codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_app]) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else if (replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (replyList[0] as bool?)!;
    }
  }

  Future<Map<String?, PigeonRemoteConfigValue?>> getAll(PigeonFirebaseApp arg_app) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.FirebaseRemoteConfigHostApi.getAll', codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_app]) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else if (replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (replyList[0] as Map<Object?, Object?>?)!.cast<String?, PigeonRemoteConfigValue?>();
    }
  }

  Future<bool> getBool(PigeonFirebaseApp arg_app, String arg_key) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.FirebaseRemoteConfigHostApi.getBool', codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_app, arg_key]) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else if (replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (replyList[0] as bool?)!;
    }
  }

  Future<int> getInt(PigeonFirebaseApp arg_app, String arg_key) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.FirebaseRemoteConfigHostApi.getInt', codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_app, arg_key]) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else if (replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (replyList[0] as int?)!;
    }
  }

  Future<double> getDouble(PigeonFirebaseApp arg_app, String arg_key) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.FirebaseRemoteConfigHostApi.getDouble', codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_app, arg_key]) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else if (replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (replyList[0] as double?)!;
    }
  }

  Future<String> getString(PigeonFirebaseApp arg_app, String arg_key) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.FirebaseRemoteConfigHostApi.getString', codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_app, arg_key]) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else if (replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (replyList[0] as String?)!;
    }
  }

  Future<PigeonRemoteConfigValue> getValue(PigeonFirebaseApp arg_app, String arg_key) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.FirebaseRemoteConfigHostApi.getValue', codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_app, arg_key]) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else if (replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (replyList[0] as PigeonRemoteConfigValue?)!;
    }
  }

  Future<void> setConfigSettings(PigeonFirebaseApp arg_app, PigeonRemoteConfigSettings arg_remoteConfigSettings) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.FirebaseRemoteConfigHostApi.setConfigSettings', codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_app, arg_remoteConfigSettings]) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return;
    }
  }

  Future<void> setDefaults(PigeonFirebaseApp arg_app, Map<String?, Object?> arg_defaultParameters) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.FirebaseRemoteConfigHostApi.setDefaults', codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_app, arg_defaultParameters]) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return;
    }
  }
}