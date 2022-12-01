import 'package:http/http.dart' as http;
import 'dart:convert';

class Authenticator
{
  static void check({
      required String username,
      required String password,
      required Function(String) onSuccess,
      required Function(http.Response) onFailure
  }) async
  {
    Uri url = Uri.http("localhost:8000", "api/login_check");

    var body = {
      "username": username,
      "password": password
    };

    http.Response response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
          "Accept": "*/*",
        },
        body: jsonEncode(body)
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      onSuccess(data['token']);
    } else {
      onFailure(response);
    }
  }
}