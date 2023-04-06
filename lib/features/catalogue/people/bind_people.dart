import 'package:get/get.dart';
import 'package:movie_catalogue/features/catalogue/people/api_people.dart';
import 'package:movie_catalogue/features/catalogue/people/controller_people.dart';

class BindingPeople implements Bindings {
  @override
  void dependencies() {
    Get.put(ControllerPeople(api: ApiPeople()));
  }
}
