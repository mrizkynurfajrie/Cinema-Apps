import 'package:movie_catalogue/framework/api1.dart';

class ApiTvShow {
  Future<dynamic> getPopularTvShow({required String page}) async {
    var r = await Api1().apiJSONGet('/tv/popular', '&page=$page');
    return r;
  }

  Future<dynamic> getTopRatedTvShow({required String page}) async {
    var r = await Api1().apiJSONGet('/tv/top_rated', '&page=$page');
    return r;
  }

  Future<dynamic> getOnTheAirTvShow({required String page}) async {
    var r = await Api1().apiJSONGet('/tv/on_the_air', '&page=$page');
    return r;
  }

  Future<dynamic> getAiringToday({required String page}) async {
    var r = await Api1().apiJSONGet('/tv/airing_today', '&page=$page');
    return r;
  }
}
