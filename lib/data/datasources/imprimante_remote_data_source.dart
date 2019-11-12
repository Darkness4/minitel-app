import 'dart:io';

import 'package:http/http.dart';
import 'package:minitel_toolbox/core/error/exceptions.dart';
import 'package:minitel_toolbox/core/funcs.dart';
import 'package:ntlm/ntlm.dart';

abstract class ImprimanteRemoteDataSource {
  /// Login to imprimante
  Future<List<Cookie>> login({String username, String password});
}

class ImprimanteRemoteDataSourceImpl implements ImprimanteRemoteDataSource {
  final NTLMClient ntlmClient;
  final List<Cookie> cookies;

  ImprimanteRemoteDataSourceImpl({
    this.ntlmClient,
    this.cookies,
  });

  @override
  Future<List<Cookie>> login({String username, String password}) async {
    ntlmClient.password = password;
    ntlmClient.username = username;
    final Response response =
        await ntlmClient.get("http://192.168.130.2/watchdoc/");

    if (response.statusCode == 200) {
      cookies.addAll(CookieUtils.parseSetCookie(response.headers));
      return cookies;
    } else {
      throw ServerException("Cannot fetch Imprimante: ${response.statusCode}");
    }
  }
}
