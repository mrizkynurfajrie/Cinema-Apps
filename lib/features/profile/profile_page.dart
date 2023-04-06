import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_catalogue/shared/constants/colors.dart';
import 'package:movie_catalogue/shared/constants/styles.dart';
import 'package:movie_catalogue/shared/widgets/page_decoration_top.dart';

class PageProfile extends StatelessWidget {
  const PageProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return PageDecorationTop(
      title: '',
      toolbarTitleColor: AppColor.whiteColor,
      backgroundColor: AppColor.bgColor,
      toolbarColor: AppColor.primaryColor,
      enableBack: false,
      center: const Center(
        child: Text(
          'Hi, there',
          style: TextStyle(
            fontSize: 16,
            color: AppColor.whiteColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(90)),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(90)),
                      border: Border.all(
                        color: AppColor.neutral.shade300,
                      )),
                  height: 120,
                  width: 120,
                  child: Icon(
                    Icons.person,
                    size: 64,
                    color: AppColor.neutral.shade400,
                  ),
                ),
              ),
            ),
            verticalSpace(16.h),
            Text(
              'Muhammad Rizky Nur Fajrie',
              style: TextStyle(
                fontSize: 16,
                color: AppColor.neutral.shade700,
                fontWeight: FontWeight.w500,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: Divider(
                thickness: 1,
                color: AppColor.neutral.shade300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
