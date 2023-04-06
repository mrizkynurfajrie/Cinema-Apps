import 'package:get/get.dart';
import 'package:movie_catalogue/features/home/api_home.dart';
import 'package:movie_catalogue/features/home/controller_home.dart';

class BindingHome implements Bindings {
  @override
  void dependencies() {
    Get.put(ControllerHome(api: ApiHome()));
  }
}
