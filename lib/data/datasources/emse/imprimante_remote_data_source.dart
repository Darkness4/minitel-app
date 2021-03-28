import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:minitel_toolbox/core/cookies/cookie_manager.dart';
import 'package:minitel_toolbox/core/error/exceptions.dart';
import 'package:minitel_toolbox/core/utils/cookie_utils.dart';
import 'package:ntlm/ntlm.dart';

abstract class ImprimanteRemoteDataSource {
  /// Login to imprimante
  Future<List<Cookie>> login(
      {required String username, required String password});

  /// Get list of cookies
  List<Cookie> get cookies;
}

@LazySingleton(as: ImprimanteRemoteDataSource)
class ImprimanteRemoteDataSourceImpl implements ImprimanteRemoteDataSource {
  final NTLMClient ntlmClient;
  final CookieManager cookieManager;

  @override
  List<Cookie> get cookies => cookieManager.imprimanteCookies;

  const ImprimanteRemoteDataSourceImpl({
    required this.ntlmClient,
    required this.cookieManager,
  });

  @override
  Future<List<Cookie>> login(
      {required String username, required String password}) async {
    ntlmClient.password = password;
    ntlmClient.username = username;
    try {
      final response =
          await ntlmClient.get(Uri.parse('http://192.168.130.2/watchdoc/'));

      if (response.statusCode == HttpStatus.ok) {
        cookies.addAll(response.headers.parseSetCookie());
        return cookies;
      } else {
        throw ServerException(
            'Cannot fetch Imprimante: ${response.statusCode} ${response.reasonPhrase}');
      }
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
