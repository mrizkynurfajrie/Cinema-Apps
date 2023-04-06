import 'package:get/get.dart';
import 'package:movie_catalogue/routes/app_routes.dart';

class ControllerSplashscreen extends GetxController {
  @override
  void onInit() {
    animationSplash();
    super.onInit();
  }

  animationSplash() async {
    await Future.delayed(const Duration(seconds: 3));
    Get.offNamed(Routes.mainPage);
    //route
  }
}
