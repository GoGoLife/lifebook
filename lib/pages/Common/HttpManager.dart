import 'dart:convert';

import 'package:http/http.dart' as http;

Future getHttpAction(String url) async {
  try {
    final http.Response response = await http.get(url);
    final Map<String, dynamic> result = json.decode(response.body);
    return result;
  } catch(error) {
    return '';
  }
}

Future postHttpAction(String url, Map<String, dynamic> param) async {
  try{
    final http.Response response = await http.post(url, body: param,
        encoding: Utf8Codec());
    final Map<String, dynamic> result = json.decode(response.body);
    return result;
  }catch(error) {
    return '';
  }
}
