import 'dart:convert';

import 'package:http/http.dart' as http;


Future<http.Response> call_api(String method, String path, Object body) {
  var url = Uri.http('localhost:8000', "api/$path");
  Map<String, String> headers = {
    "Content-Type": "application/json",
    "Accept": "*/*"
  };

  var request = http.get(url, headers: headers);

  var jsonBody = jsonEncode(body);
  switch (method.toUpperCase())
  {
    case "GET":
      return http.get(url, headers: headers);
      break;
    case "POST":
      return http.post(url, headers: headers, body: jsonBody);
      break;
    case "PATCH":
      return http.patch(url, headers: headers);
      break;
    case "DELETE":
      return http.delete(url, headers: headers);
      break;
  }
  return http.get(url, headers: headers);

}
