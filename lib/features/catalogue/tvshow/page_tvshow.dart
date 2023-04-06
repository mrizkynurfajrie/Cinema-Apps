import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:movie_catalogue/features/catalogue/tvshow/controller_tvshow.dart';
import 'package:movie_catalogue/features/catalogue/tvshow/view/view_airing_today.dart';
import 'package:movie_catalogue/features/catalogue/tvshow/view/view_on_the_air.dart';
import 'package:movie_catalogue/features/catalogue/tvshow/view/view_popular.dart';
import 'package:movie_catalogue/features/catalogue/tvshow/view/view_top_rated.dart';
import 'package:movie_catalogue/features/catalogue/widgets/label_selection.dart';
import 'package:movie_catalogue/shared/constants/colors.dart';
import 'package:movie_catalogue/shared/helpers/ui_state.dart';
import 'package:movie_catalogue/shared/widgets/page_decoration_top.dart';

class PageTvShow extends GetView<ControllerTvShow> {
  const PageTvShow({super.key});

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
          'TV Show',
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
                        label: 'Popular',
                        onTap: () {
                          controller.tvShowState.value = TvShowState.popular;
                          controller.pageController.animateToPage(
                            0,
                            duration: const Duration(milliseconds: 350),
                            curve: Curves.easeInOut,
                          );
                        },
                        selected:
                            controller.tvShowState.value == TvShowState.popular,
                      ),
                      LabelSelection(
                        label: 'Top Rated',
                        onTap: () {
                          controller.tvShowState.value = TvShowState.topRated;
                          controller.pageController.animateToPage(
                            1,
                            duration: const Duration(milliseconds: 350),
                            curve: Curves.easeInOut,
                          );
                        },
                        selected: controller.tvShowState.value ==
                            TvShowState.topRated,
                      ),
                      LabelSelection(
                        label: 'On The Air',
                        onTap: () {
                          controller.tvShowState.value = TvShowState.onTheAir;
                          controller.pageController.animateToPage(
                            2,
                            duration: const Duration(milliseconds: 350),
                            curve: Curves.easeInOut,
                          );
                        },
                        selected: controller.tvShowState.value ==
                            TvShowState.onTheAir,
                      ),
                      LabelSelection(
                        label: 'Airing Today',
                        onTap: () {
                          controller.tvShowState.value =
                              TvShowState.airingToday;
                          controller.pageController.animateToPage(
                            3,
                            duration: const Duration(milliseconds: 350),
                            curve: Curves.easeInOut,
                          );
                        },
                        selected: controller.tvShowState.value ==
                            TvShowState.airingToday,
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
                  ViewPopularTv(),
                  ViewTopRatedTv(),
                  ViewOnTheAirTv(),
                  ViewAiringTodayTv(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
