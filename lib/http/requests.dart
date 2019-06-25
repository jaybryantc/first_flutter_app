import 'dart:convert';
import 'dart:io';

class Requests {
  static const String _base_url = "";
  static const String _api_key = "";

  static void call(String endpoint, {Map<String, String> requestParams, onSuccess, onError}) {

    _makeRequest(endpoint, requestParams: requestParams)
        ..then((response){
          print(response);
          onSuccess(response);
        }, onError: onError)
        ..catchError(onError);

  }

  static Future<String> _makeRequest(String endpoint, {Map<String, String> requestParams}) async {

    HttpClient client = new HttpClient();
    var uri = Uri.http(_base_url, endpoint);
    var request = await client.getUrl(uri);
    request.headers.add("x-api-key", _api_key);
    var response = await request.close();
    var responseBody = response.transform(utf8.decoder).join();

    return responseBody;
  }

}

typedef onSuccess(data);
typedef onError(error);