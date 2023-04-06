import 'package:get/get.dart';
import 'package:movie_catalogue/features/catalogue/movie/api_movie.dart';
import 'package:movie_catalogue/features/catalogue/movie/controller_movie.dart';

class BindingMovie implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ControllerMovie(api: ApiMovie()));
  }
}
