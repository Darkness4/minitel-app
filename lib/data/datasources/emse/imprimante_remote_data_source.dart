import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:minitel_toolbox/core/error/exceptions.dart';
import 'package:minitel_toolbox/core/utils.dart';
import 'package:ntlm/ntlm.dart';

abstract class ImprimanteRemoteDataSource {
  /// Login to imprimante
  Future<List<Cookie>> login({String username, String password});

  /// Get list of cookies
  List<Cookie> get cookies;
}

class ImprimanteRemoteDataSourceImpl implements ImprimanteRemoteDataSource {
  final NTLMClient ntlmClient;

  @override
  final List<Cookie> cookies;

  const ImprimanteRemoteDataSourceImpl({
    @required this.ntlmClient,
    @required this.cookies,
  });

  @override
  Future<List<Cookie>> login({String username, String password}) async {
    ntlmClient.password = password;
    ntlmClient.username = username;
    try {
      final Response response =
          await ntlmClient.get("http://192.168.130.2/watchdoc/");

      if (response.statusCode == 200) {
        cookies.addAll(response.headers.parseSetCookie());
        return cookies;
      } else {
        throw ServerException(
            "Cannot fetch Imprimante: ${response.statusCode}");
      }
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
