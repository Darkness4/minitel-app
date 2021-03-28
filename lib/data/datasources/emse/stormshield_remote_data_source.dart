import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:minitel_toolbox/core/error/exceptions.dart';

abstract class StormshieldRemoteDataSource {
  /// Login to stormshield
  Future<void> login({
    required String uid,
    required String pswd,
    required String selectedUrl,
    required int selectedTime,
  });

  /// Fetch status from stormshield
  Future<String> fetchStatus(String selectedUrl);
}

/// This class handle the connections through stormshield, aka the gateway.
@LazySingleton(as: StormshieldRemoteDataSource)
class StormshieldRemoteDataSourceImpl implements StormshieldRemoteDataSource {
  final http.Client client;

  StormshieldRemoteDataSourceImpl({
    required this.client,
  });

  @override
  Future<void> login({
    required String uid,
    required String pswd,
    required String selectedUrl,
    required int selectedTime,
  }) async {
    // SessionId
    final data = <String, String>{
      'uid': uid,
      'time': selectedTime.toString(),
      'pswd': pswd,
    };
    final response = await client.post(
      Uri.parse('https://$selectedUrl/auth/plain.html'),
      body: data,
      headers: {HttpHeaders.cookieHeader: 'lang=us; disclaimer=1;'},
    );
    if (response.statusCode == HttpStatus.ok) {
      if (response.body.contains('title_error')) {
        throw ClientException('Bad Username or Password');
      }
    } else {
      throw ServerException(
          'HttpError: ${response.statusCode} ${response.reasonPhrase}');
    }
  }

  @override
  Future<String> fetchStatus(String selectedUrl) async {
    final url = 'https://$selectedUrl/auth/login.html';
    final exp = RegExp(r'<span id="l_rtime">([^<]*)<\/span>');

    final response = await client.post(Uri.parse(url));

    final body = response.body;
    if (response.statusCode == HttpStatus.ok) {
      if (body.contains('l_rtime')) {
        return exp.firstMatch(body)!.group(1)!;
      } else {
        throw NotLoggedInException();
      }
    } else {
      throw ServerException(
          'HttpError: ${response.statusCode} ${response.reasonPhrase}');
    }
  }
}
