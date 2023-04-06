import 'package:movie_catalogue/framework/api1.dart';

class ApiMovie {
  Future<dynamic> getTopRatedMovie({required String page}) async {
    var r = await Api1().apiJSONGet('/movie/top_rated', '&page=$page');
    return r;
  }

  Future<dynamic> getUpcomingMovie({required String page}) async {
    var r = await Api1().apiJSONGet('/movie/upcoming', '&page=$page');
    return r;
  }

  Future<dynamic> getNowPlayingMovie({required String page}) async {
    var r = await Api1().apiJSONGet('/movie/now_playing', '&page=$page');
    return r;
  }

  Future<dynamic> getPopularMovie({required String page}) async {
    var r = await Api1().apiJSONGet('/movie/popular', '&page=$page');
    return r;
  }
}
