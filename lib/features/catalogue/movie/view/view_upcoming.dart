import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:movie_catalogue/features/catalogue/movie/controller_movie.dart';
import 'package:movie_catalogue/framework/api1.dart';
import 'package:movie_catalogue/response/movie_response/upcoming_response.dart';
import 'package:movie_catalogue/shared/constants/colors.dart';
import 'package:movie_catalogue/shared/constants/styles.dart';
import 'package:movie_catalogue/shared/helpers/format_date_time.dart';
import 'package:movie_catalogue/shared/helpers/ui_state.dart';
import 'package:movie_catalogue/shared/widgets/button_primary.dart';
import 'package:movie_catalogue/shared/widgets/button_primary_outline.dart';
import 'package:movie_catalogue/shared/widgets/loading_indicator.dart';

class ViewUpcoming extends GetView<ControllerMovie> {
  const ViewUpcoming({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        switch (controller.uiState.value) {
          case UIState.loading:
            return loadingIndicator(context);
          case UIState.success:
            return RefreshIndicator(
              onRefresh: () async {
                controller.getUpcomingMovie();
              },
              child: SizedBox(
                width: Get.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Upcoming movies, soon :)",
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColor.neutral.shade700,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    verticalSpace(6.h),
                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.listUpcoming.length,
                        itemBuilder: ((context, index) => CardItems(
                              result: controller.listUpcoming[index],
                            )),
                      ),
                    ),
                    verticalSpace(24.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(90)),
                          child: Container(
                            width: 25,
                            height: 25,
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColor.primaryColor),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(90)),
                              color: AppColor.whiteColor,
                            ),
                            child: Center(
                              child: Text(
                                controller.upcomingPage.value.toString(),
                                style: TextStyle(
                                  fontSize: 12,
                                  color: AppColor.neutral.shade700,
                                ),
                              ),
                            ),
                          ),
                        ),
                        horizontalSpace(6.w),
                        Text(
                          'of ${controller.upcomingMovie.value.totalPages}',
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColor.neutral.shade700,
                          ),
                        ),
                      ],
                    ),
                    verticalSpace(12.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ButtonPrimaryOutline(
                          height: 42.h,
                          width: 100.w,
                          borderRadius: 24,
                          icon: Icons.arrow_back_ios,
                          enable:
                              controller.upcomingPage.value == 1 ? false : true,
                          onPressed: () async {
                            controller.upcomingPage.value =
                                controller.upcomingPage.value - 1;
                            await controller.getUpcomingMovie();
                          },
                          label: 'Back',
                        ),
                        horizontalSpace(12.w),
                        ButtonPrimary(
                          height: 42.h,
                          size: 100.w,
                          cornerRadius: 24,
                          icon: Icons.arrow_forward_ios,
                          onPressed: () async {
                            controller.upcomingPage.value =
                                controller.upcomingPage.value + 1;
                            log('movie page : ${controller.upcomingPage.value}');
                            await controller.getUpcomingMovie();
                          },
                          label: 'Next',
                        ),
                      ],
                    ),
                    verticalSpace(150.h),
                  ],
                ),
              ),
            );
          default:
            return const SizedBox();
        }
      },
    );
  }
}

class CardItems extends StatelessWidget {
  final UpcomingResult result;

  const CardItems({
    Key? key,
    required this.result,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        child: Container(
          decoration: BoxDecoration(
            color: AppColor.boxItemColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(8),
            ),
            border: Border.all(color: AppColor.whiteColor),
            boxShadow: [
              BoxShadow(
                  color: const Color(0xff333333).withOpacity(.15),
                  spreadRadius: 0,
                  blurRadius: 3,
                  offset: const Offset(0, 1)),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: AlignmentDirectional.topEnd,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    child: CachedNetworkImage(
                      height: 204,
                      width: 136,
                      imageUrl: Api1().imageUrl + result.posterPath!,
                      progressIndicatorBuilder: (context, url, progress) =>
                          const Center(
                        child: CircularProgressIndicator(),
                      ),
                      errorWidget: (context, url, error) => const Icon(
                        Icons.error,
                        color: Colors.red,
                        size: 24,
                      ),
                      fit: BoxFit.contain,
                    ),
                  ),
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    child: Image.asset(
                      result.adult == true
                          ? 'assets/age_adult.png'
                          : 'assets/age_everyone.png',
                      height: 36,
                      width: 24,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      CupertinoIcons.star_fill,
                      color: Colors.yellow,
                      size: 18,
                    ),
                    horizontalSpace(6.w),
                    Text(
                      result.voteAverage!.toString(),
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColor.whiteColor,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: 136,
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                child: Text(
                  result.title!,
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColor.whiteColor,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                child: Row(
                  children: [
                    Text(
                      FormatDateTime.getYear(result.releaseDate!).toString(),
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColor.whiteColor,
                      ),
                    ),
                    horizontalSpace(4.w),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
