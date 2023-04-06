import 'package:get/get.dart';
import 'package:movie_catalogue/features/catalogue/movie/api_movie.dart';
import 'package:movie_catalogue/features/catalogue/movie/controller_movie.dart';
import 'package:movie_catalogue/features/main/controller_main.dart';
import 'package:movie_catalogue/features/splashscreen/controller_splashscreen.dart';

class ControllerBind extends Bindings {
  @override
  void dependencies() {
    Get.put(ControllerSplashscreen());
    // Get.put(ControllerMovie(api: ApiMovie()));
    Get.put(ControllerMain());
  }
}
