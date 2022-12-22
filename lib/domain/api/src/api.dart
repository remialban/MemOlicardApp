import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:memolicard_app/domain/authentication/authentication.dart';

import 'error.dart';

class Api
{
  ApiExceptionInterface apiException;

  Api({required this.apiException});

  getCollection(String domain) async {
    try {
      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Accept": "*/*",
        "Authorization": "Bearer ${await Authenticator.getToken()}",
      };
      http.Response response = await http.get(_getUri(domain: domain), headers: headers);

      if ((response.statusCode ~/ 100) == 2) {
        return jsonDecode(response.body);
      } else {
        apiException.onErrorServer();
      }
    } catch (e) {
      apiException.onErrorConnection();
    }
  }

  Uri _getUri({required String domain})
  {
    return Uri.http(
      "192.168.0.60:8000",
      "/api/$domain",
    );
  }
}