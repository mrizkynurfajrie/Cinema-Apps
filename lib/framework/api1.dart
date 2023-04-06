import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class Api1 {
  String baseUrl = 'https://api.themoviedb.org/3';
  String apiKey = '?api_key=b31f9c6738a42ff6ba8cd09fec8a3708';
  String imageUrl = 'https://image.tmdb.org/t/p/w500';

  Future<dynamic> apiJSONGet(
    String url,
    String page,
  ) async {
    Map<String, String> headers = {
      'content-Type': 'application/json',
    };
    log('headers = $headers');
    log('url = $baseUrl$url$apiKey$page');

    http.Response r = await http.get(Uri.parse(baseUrl + url + apiKey + page),
        headers: headers);
    log("status codenya ${r.statusCode}");
    var data = json.decode(r.body);
    // log('data : $data');
    return data;
  }
}
