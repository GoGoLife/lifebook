import 'dart:convert';
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
  http.Response response = await http.post(finalUrl,
      headers: {'content-type': 'application/json'},
      body: json.encode(param),
      encoding: Utf8Codec());
  return response.body;
}

Future<Map<String, dynamic>> defaultPostHttpAction(
    String url, Map<String, dynamic> param) async {
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

class HttpManager {
  static void get(String url, Function successCallBack,
      {Map<String, dynamic> params, Function errorCallBack}) async {
    if (params != null && params.isNotEmpty) {
      StringBuffer sb = new StringBuffer("?");
      params.forEach((key, value) {
        sb.write("$key" + "=" + "$value" + "&");
      });
      String paramStr = sb.toString();
      paramStr = paramStr.substring(0, paramStr.length - 1);
      url += paramStr;
    }

    try {
      url = API.APIDetails.baseUrl + url;
      http.Response response = await http.get(
        url,
        headers: {'content-type': 'application/json'},
      );
      if (successCallBack != null) {
        successCallBack(response.body);
      }
    } catch (exception) {
      if (errorCallBack != null) {
        errorCallBack(exception);
      }
    }
  }

  static void post(String url, Function callback,
      {Map<String, String> params, Function errorCallback}) async {
    try {
      url = API.APIDetails.baseUrl + url;
      http.Response res = await http.post(
        url,
        body: params,
        encoding: Utf8Codec(),
      );

      if (callback != null) {
        callback(res.body);
      }
    } catch (e) {
      if (errorCallback != null) {
        errorCallback(e);
      }
    }
  }
}
