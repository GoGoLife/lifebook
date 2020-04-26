import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'api_list.dart' as API;

Future getHttpAction(String url) async {
  String finalUrl = API.APIDetails.baseUrl + url;
  try {
    final http.Response response = await http.get(finalUrl);
    final Map<String, dynamic> result = json.decode(response.body);
    return result;
  } catch (error) {
    return '';
  }
}

Future postHttpAction(String url, Map<String, dynamic> param) async {
  String finalUrl = API.APIDetails.baseUrl + url;
  http.Response response = await http.post(
      finalUrl,
      headers: {'content-type': 'application/json'},
      body: json.encode(param),
      encoding: Utf8Codec());
  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('statusCode:${response.statusCode}');
  }
}

Future<Map<String, dynamic>> defaultPostHttpAction(String url, Map<String, dynamic> param) async {
  String finalUrl = API.APIDetails.baseUrl + url;
  final http.Response response = await http.post(
      finalUrl,
      headers: {'content-type': 'application/json'},
      body: json.encode(param),
      encoding: Utf8Codec(),
  );
  final Map<String, dynamic> result = json.decode(response.body);
  return result;
}
