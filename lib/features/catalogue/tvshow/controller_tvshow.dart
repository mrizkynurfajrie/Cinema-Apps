import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_catalogue/features/catalogue/tvshow/api_tvshow.dart';
import 'package:movie_catalogue/response/tvshow_response/airing_today_response.dart';
import 'package:movie_catalogue/response/tvshow_response/on_the_air_response.dart';
import 'package:movie_catalogue/response/tvshow_response/popular_response.dart';
import 'package:movie_catalogue/response/tvshow_response/top_rated_response.dart';
import 'package:movie_catalogue/shared/helpers/ui_state.dart';

class ControllerTvShow extends GetxController {
  final ApiTvShow api;
  ControllerTvShow({required this.api});

  var uiState = UIState.initial.obs;
  var tvShowState = TvShowState.popular.obs;

  late PageController pageController;
  var popularPage = 1.obs;
  var topRatedPage = 1.obs;
  var onTheAirPage = 1.obs;
  var airingTodayPage = 1.obs;

  final listPopular = List<PopularTvResult>.empty().obs;
  final listTopRated = List<TopRatedTvResult>.empty().obs;
  final listOnTheAir = List<OnTheAirResult>.empty().obs;
  final listAiringToday = List<AiringTodayTvResult>.empty().obs;
  var popularTvShow = PopularTv().obs;
  var topRatedTvShow = TopRatedTv().obs;
  var onTheAirTvShow = OnTheAirTv().obs;
  var airingTodayTvShow = AiringTodayTv().obs;

  @override
  void onInit() async {
    pageController = PageController(initialPage: 0);
    await getPopularTvShow();
    await getTopRatedTvShow();
    await getOnTheAirTvShow();
    await getAiringToday();
    super.onInit();
  }

  getPopularTvShow() async {
    uiState.value = UIState.loading;
    try {
      var r = await api.getPopularTvShow(page: popularPage.toString());
      log('result : $r');
      if (r != null) {
        var result = r;
        var listResult = r["results"];
        popularTvShow.value = PopularTv.fromJson(result);
        var listData = (listResult as List)
            .map((listResult) => PopularTvResult.fromJson(listResult))
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

  getTopRatedTvShow() async {
    uiState.value = UIState.loading;
    try {
      var r = await api.getTopRatedTvShow(page: topRatedPage.toString());
      log('result : $r');
      if (r != null) {
        var result = r;
        var listResult = r["results"];
        topRatedTvShow.value = TopRatedTv.fromJson(result);
        var listData = (listResult as List)
            .map((listResult) => TopRatedTvResult.fromJson(listResult))
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

  getOnTheAirTvShow() async {
    uiState.value = UIState.loading;
    try {
      var r = await api.getOnTheAirTvShow(page: onTheAirPage.toString());
      log('result : $r');
      if (r != null) {
        var result = r;
        var listResult = r["results"];
        onTheAirTvShow.value = OnTheAirTv.fromJson(result);
        var listData = (listResult as List)
            .map((listResult) => OnTheAirResult.fromJson(listResult))
            .toList();
        if (listData.isNotEmpty) {
          listOnTheAir.clear();
          listOnTheAir.addAll(listData);
        }
      }
      uiState.value = UIState.success;
    } catch (e) {
      uiState.value = UIState.error;
      print(e.toString());
    }
  }

  getAiringToday() async {
    uiState.value = UIState.loading;
    try {
      var r = await api.getAiringToday(page: airingTodayPage.toString());
      log('result : $r');
      if (r != null) {
        var result = r;
        var listResult = r["results"];
        airingTodayTvShow.value = AiringTodayTv.fromJson(result);
        var listData = (listResult as List)
            .map((listResult) => AiringTodayTvResult.fromJson(listResult))
            .toList();
        if (listData.isNotEmpty) {
          listAiringToday.clear();
          listAiringToday.addAll(listData);
        }
      }
      uiState.value = UIState.success;
    } catch (e) {
      uiState.value = UIState.error;
      print(e.toString());
    }
  }
}
