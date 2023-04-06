import 'package:get/get.dart';
import 'package:movie_catalogue/features/catalogue/movie/api_movie.dart';
import 'package:movie_catalogue/features/catalogue/movie/controller_movie.dart';
import 'package:movie_catalogue/features/home/api_home.dart';
import 'package:movie_catalogue/features/home/controller_home.dart';

class BindingMain implements Bindings {
  @override
  void dependencies() {
    Get.put(ControllerHome(api: ApiHome()));
  }
}
