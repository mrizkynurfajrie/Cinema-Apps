import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';
import 'package:movie_catalogue/features/home/api_home.dart';
import 'package:movie_catalogue/response/trending_response.dart';

class ControllerHome extends GetxController {
  final ApiHome api;
  ControllerHome({required this.api});

  CarouselController carouselController = CarouselController();

  var listBanner = List<TrendingResult>.empty().obs;
  var trending = Trending().obs;
  var currentSlide = 0.obs;
  var loading = false.obs;
  var pageUrl = '&page=1';

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  getData() async {
    loading.value = true;
    try {
      var r = await api.getTrendingData(page: pageUrl);
      if (r != null) {
        var result = r;
        var listResult = r["results"];
        trending.value = Trending.fromJson(result);
        var listData = (listResult as List)
            .map((listResult) => TrendingResult.fromJson(listResult))
            .toList();
        if (listData.isNotEmpty) {
          listBanner.clear();
          listBanner.addAll(listData);
        }
      }
      loading.value = false;
    } catch (e) {
      loading.value = false;
      print(e.toString());
    }
  }
}
