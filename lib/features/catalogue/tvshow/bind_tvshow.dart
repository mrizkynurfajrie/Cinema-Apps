import 'package:get/get.dart';
import 'package:movie_catalogue/features/catalogue/tvshow/api_tvshow.dart';
import 'package:movie_catalogue/features/catalogue/tvshow/controller_tvshow.dart';

class BindingTvShow implements Bindings {
  @override
  void dependencies() {
    Get.put(ControllerTvShow(api: ApiTvShow()));
  }
}
