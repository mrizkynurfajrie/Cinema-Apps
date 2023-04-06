import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:movie_catalogue/features/catalogue/movie/api_movie.dart';
import 'package:movie_catalogue/response/movie_response/now_playing_response.dart';
import 'package:movie_catalogue/response/movie_response/popular_response.dart';
import 'package:movie_catalogue/response/movie_response/top_rated_response.dart';
import 'package:movie_catalogue/response/movie_response/upcoming_response.dart';
import 'package:movie_catalogue/shared/helpers/ui_state.dart';

class ControllerMovie extends GetxController {
  final ApiMovie api;
  ControllerMovie({required this.api});

  var uiState = UIState.initial.obs;
  var movieState = MovieState.topRated.obs;

  late PageController pageController;
  var topRatedPage = 1.obs;
  var upcomingPage = 1.obs;
  var nowPlayingPage = 1.obs;
  var popularPage = 1.obs;

  final listTopRated = List<TopRatedResult>.empty().obs;
  final listUpcoming = List<UpcomingResult>.empty().obs;
  final listNowPlaying = List<NowPlayingResult>.empty().obs;
  final listPopular = List<PopularResult>.empty().obs;
  var topRatedMovie = TopRatedMovie().obs;
  var upcomingMovie = UpcomingMovie().obs;
  var nowPlayingMovie = NowPlayingMovie().obs;
  var popularMovie = PopularMovie().obs;

  @override
  void onInit() async {
    pageController = PageController(initialPage: 0);
    getTopRatedMovie();
    getUpcomingMovie();
    getNowPlayingMovie();
    getPopularMovie();
    super.onInit();
  }

  getTopRatedMovie() async {
    uiState.value = UIState.loading;
    try {
      var r = await api.getTopRatedMovie(page: topRatedPage.toString());
      log('result : $r');
      if (r != null) {
        var result = r;
        var listResult = r["results"];
        topRatedMovie.value = TopRatedMovie.fromJson(result);
        var listData = (listResult as List)
            .map((listResult) => TopRatedResult.fromJson(listResult))
            .toList();
        if (listData.isNotEmpty) {
          listTopRated.clear();
          listTopRated.addAll(listData);
        }
      }
      uiState.value = UIState.success;
    } catch (e) {
      uiState.value = UIState.error;
      print(e.toString());
    }
  }

  getUpcomingMovie() async {
    uiState.value = UIState.loading;
    try {
      var r = await api.getUpcomingMovie(page: upcomingPage.toString());
      log('result : $r');
      if (r != null) {
        var result = r;
        var listResult = r["results"];
        upcomingMovie.value = UpcomingMovie.fromJson(result);
        var listData = (listResult as List)
            .map((listResult) => UpcomingResult.fromJson(listResult))
            .toList();
        if (listData.isNotEmpty) {
          listUpcoming.clear();
          listUpcoming.addAll(listData);
        }
      }
      uiState.value = UIState.success;
    } catch (e) {
      uiState.value = UIState.error;
      print(e.toString());
    }
  }

  getNowPlayingMovie() async {
    uiState.value = UIState.loading;
    try {
      var r = await api.getNowPlayingMovie(page: nowPlayingPage.toString());
      log('result : $r');
      if (r != null) {
        var result = r;
        var listResult = r["results"];
        nowPlayingMovie.value = NowPlayingMovie.fromJson(result);
        var listData = (listResult as List)
            .map((listResult) => NowPlayingResult.fromJson(listResult))
            .toList();
        if (listData.isNotEmpty) {
          listNowPlaying.clear();
          listNowPlaying.addAll(listData);
        }
      }
      uiState.value = UIState.success;
    } catch (e) {
      uiState.value = UIState.error;
      print(e.toString());
    }
  }

  getPopularMovie() async {
    uiState.value = UIState.loading;
    try {
      var r = await api.getPopularMovie(page: popularPage.toString());
      log('result : $r');
      if (r != null) {
        var result = r;
        var listResult = r["results"];
        popularMovie.value = PopularMovie.fromJson(result);
        var listData = (listResult as List)
            .map((listResult) => PopularResult.fromJson(listResult))
            .toList();
        if (listData.isNotEmpty) {
          listPopular.clear();
          listPopular.addAll(listData);
        }
      }
      uiState.value = UIState.success;
    } catch (e) {
      uiState.value = UIState.error;
      print(e.toString());
    }
  }
}
