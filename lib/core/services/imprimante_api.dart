import 'package:http/http.dart';
import 'package:ntlm/ntlm.dart';

class ImprimanteAPI {
  String _cookie;

  String get cookie => _cookie;

  Future<String> login({String username, String password}) async {
    final NTLMClient client = NTLMClient(
      domain: "",
      workstation: "LAPTOP",
      username: username,
      password: password,
    );
    try {
      final Response response =
          await client.get("http://192.168.130.2/watchdoc/");
      return _cookie = response.headers['set-cookie'];
    } catch (e) {
      rethrow;
    }
  }
}
