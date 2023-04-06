import 'package:movie_catalogue/framework/api1.dart';

class ApiPeople {
  Future<dynamic> getPopularPeople({required String page}) async {
    var r = await Api1().apiJSONGet('/person/popular', '&page=$page');
    return r;
  }
}
