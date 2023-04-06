import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:movie_catalogue/features/catalogue/movie/controller_movie.dart';
import 'package:movie_catalogue/features/catalogue/movie/view/view_nowplaying.dart';
import 'package:movie_catalogue/features/catalogue/movie/view/view_popular.dart';
import 'package:movie_catalogue/features/catalogue/movie/view/view_toprated.dart';
import 'package:movie_catalogue/features/catalogue/movie/view/view_upcoming.dart';
import 'package:movie_catalogue/features/catalogue/widgets/label_selection.dart';
import 'package:movie_catalogue/shared/constants/colors.dart';
import 'package:movie_catalogue/shared/helpers/ui_state.dart';
import 'package:movie_catalogue/shared/widgets/page_decoration_top.dart';

class PageMovie extends GetView<ControllerMovie> {
  const PageMovie({super.key});

  @override
  Widget build(BuildContext context) {
    return PageDecorationTop(
      title: '',
      resizeAvoidBottom: true,
      backgroundColor: AppColor.bgColor,
      toolbarColor: AppColor.primaryColor,
      toolbarTitleColor: AppColor.whiteColor,
      center: Padding(
        padding: EdgeInsets.only(left: 116.w),
        child: const Text(
          'Movie',
          style: TextStyle(
            fontSize: 16,
            color: AppColor.whiteColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 12,
              ),
              child: Obx(
                () => SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      LabelSelection(
                        label: 'Top Rated',
                        onTap: () {
                          controller.movieState.value = MovieState.topRated;
                          controller.pageController.animateToPage(
                            0,
                            duration: const Duration(milliseconds: 350),
                            curve: Curves.easeInOut,
                          );
                        },
                        selected:
                            controller.movieState.value == MovieState.topRated,
                      ),
                      LabelSelection(
                        label: 'Upcoming',
                        onTap: () {
                          controller.movieState.value = MovieState.upcoming;
                          controller.pageController.animateToPage(
                            1,
                            duration: const Duration(milliseconds: 350),
                            curve: Curves.easeInOut,
                          );
                        },
                        selected:
                            controller.movieState.value == MovieState.upcoming,
                      ),
                      LabelSelection(
                        label: 'Now Playing',
                        onTap: () {
                          controller.movieState.value = MovieState.nowPlaying;
                          controller.pageController.animateToPage(
                            2,
                            duration: const Duration(milliseconds: 350),
                            curve: Curves.easeInOut,
                          );
                        },
                        selected: controller.movieState.value ==
                            MovieState.nowPlaying,
                      ),
                      LabelSelection(
                        label: 'Popular',
                        onTap: () {
                          controller.movieState.value = MovieState.popular;
                          controller.pageController.animateToPage(
                            3,
                            duration: const Duration(milliseconds: 350),
                            curve: Curves.easeInOut,
                          );
                        },
                        selected:
                            controller.movieState.value == MovieState.popular,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: controller.pageController,
                children: const [
                  ViewTopRatedMovie(),
                  ViewUpcoming(),
                  ViewNowPlaying(),
                  ViewPopular(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
