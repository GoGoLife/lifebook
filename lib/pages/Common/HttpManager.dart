import 'dart:convert';
import 'package:http/http.dart' as http;
import 'api_list.dart' as API;
import 'package:life_book/model/HomeModel.dart';

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

Future<HomeListModel> postHttpAction(String url, Map<String, dynamic> param) async {
  String finalUrl = API.APIDetails.baseUrl + url;
  final http.Response response = await http.post(finalUrl,
      body: json.encode(param), encoding: Utf8Codec());
  final Map<String, dynamic> result = json.decode(response.body);
  return HomeListModel.fromJson(result);
//  try {
//
//  } catch (error) {
//    return Future.error('http request error');
//  }
}
