import 'package:movie_catalogue/framework/api1.dart';

class ApiHome {
  Future<dynamic> getTrendingData({required String page}) async {
    var r = await Api1().apiJSONGet('/trending/all/day', page);
    return r;
  }
}
