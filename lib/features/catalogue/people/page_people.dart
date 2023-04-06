import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:movie_catalogue/features/catalogue/people/controller_people.dart';
import 'package:movie_catalogue/features/catalogue/people/view/view_popular.dart';
import 'package:movie_catalogue/features/catalogue/widgets/label_selection.dart';
import 'package:movie_catalogue/shared/constants/colors.dart';
import 'package:movie_catalogue/shared/helpers/ui_state.dart';
import 'package:movie_catalogue/shared/widgets/page_decoration_top.dart';

class PagePeople extends GetView<ControllerPeople> {
  const PagePeople({super.key});

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
          'People',
          style: TextStyle(
            fontSize: 16,
            color: AppColor.whiteColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                          controller.peopleState.value = PeopleState.popular;
                          controller.pageController.animateToPage(
                            0,
                            duration: const Duration(milliseconds: 350),
                            curve: Curves.easeInOut,
                          );
                        },
                        selected:
                            controller.peopleState.value == PeopleState.popular,
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
                  ViewPopularPeople(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
