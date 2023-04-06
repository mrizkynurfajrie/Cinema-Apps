import 'package:get/get.dart';
import 'package:movie_catalogue/features/catalogue/movie/bind_movie.dart';
import 'package:movie_catalogue/features/catalogue/movie/page_movie.dart';
import 'package:movie_catalogue/features/catalogue/people/bind_people.dart';
import 'package:movie_catalogue/features/catalogue/people/page_people.dart';
import 'package:movie_catalogue/features/catalogue/tvshow/bind_tvshow.dart';
import 'package:movie_catalogue/features/catalogue/tvshow/page_tvshow.dart';
import 'package:movie_catalogue/features/home/search/page_search.dart';
import 'package:movie_catalogue/features/main/binding_main.dart';
import 'package:movie_catalogue/features/main/page_main.dart';
import 'package:movie_catalogue/features/splashscreen/page_splashscreen.dart';
import 'package:movie_catalogue/routes/app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.initial,
      page: () => const PageSplashscreen(),
    ),
    GetPage(
      name: Routes.mainPage,
      page: () => PageMain(),
      binding: BindingMain(),
    ),
    GetPage(
      name: Routes.moviePage,
      page: () => const PageMovie(),
      binding: BindingMovie(),
    ),
    GetPage(
      name: Routes.tvshowPage,
      page: () => const PageTvShow(),
      binding: BindingTvShow(),
    ),
    GetPage(
      name: Routes.peoplePage,
      page: () => const PagePeople(),
      binding: BindingPeople(),
    ),
    GetPage(
      name: Routes.searchPage,
      page: () => const PageSearch(),
    ),
  ];
}
