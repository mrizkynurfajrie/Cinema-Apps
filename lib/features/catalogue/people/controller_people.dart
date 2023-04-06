import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_catalogue/features/catalogue/people/api_people.dart';
import 'package:movie_catalogue/response/person_response/popular_response.dart';
import 'package:movie_catalogue/shared/helpers/ui_state.dart';

class ControllerPeople extends GetxController {
  final ApiPeople api;
  ControllerPeople({required this.api});

  var loading = false.obs;
  var peopleState = PeopleState.popular.obs;

  late PageController pageController;
  var popularPage = 1.obs;

  var listPopular = List<PopularPersonResult>.empty().obs;
  var popularPerson = PopularPerson().obs;

  @override
  void onInit() async {
    pageController = PageController(initialPage: 0);
    getPopularPerson();
    super.onInit();
  }

  getPopularPerson() async {
    loading.value = true;
    try {
      var r = await api.getPopularPeople(page: popularPage.toString());
      log('result : $r');
      if (r != null) {
        var result = r;
        var listResult = r["results"];
        popularPerson.value = PopularPerson.fromJson(result);
        var listData = (listResult as List)
            .map((listResult) => PopularPersonResult.fromJson(listResult))
            .toList();
        if (listData.isNotEmpty) {
          listPopular.clear();
          listPopular.addAll(listData);
        }
      }
      loading.value = false;
    } catch (e) {
      loading.value = false;
      print(e.toString());
    }
  }
}
