import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:movie_catalogue/shared/constants/colors.dart';
import 'package:movie_catalogue/shared/widgets/menu_item_image.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar(
      {Key? key, required this.selectedIndex, required this.onTap})
      : super(key: key);

  final Function(int index) onTap;
  final int selectedIndex;

  Widget _itemMenu(
    BuildContext context, {
    required Function() onTap,
    required String label,
    required bool isSelected,
    required String iconPrimary,
    required Color primaryColor,
  }) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 20.w,
            height: 20.w,
            // margin: EdgeInsets.only(bottom: Insets.xs),
            child: MenuItemImage(
              primaryIcon: iconPrimary,
              primaryColor:
                  isSelected ? primaryColor : AppColor.neutral.shade300,
            ),
          ),
          Text(
            label,
            style: TextStyle(
              color: isSelected
                  ? AppColor.primaryColor
                  : AppColor.neutral.shade400,
              fontSize: 10,
              fontWeight: FontWeight.w300,
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: (60.w - 10.w),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0xFFEBEBEB),
            spreadRadius: 0,
            blurRadius: 9,
            offset: Offset(0, -2),
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _itemMenu(
            context,
            onTap: () {
              onTap(0);
            },
            label: 'Home'.tr,
            isSelected: selectedIndex == 0,
            iconPrimary: 'assets/home.svg',
            primaryColor: selectedIndex == 0
                ? AppColor.primaryColor
                : AppColor.neutral.shade600,
          ),
          Stack(
            children: [
              _itemMenu(
                context,
                onTap: () {
                  onTap(1);
                },
                label: 'Profile'.tr,
                isSelected: selectedIndex == 1,
                iconPrimary: 'assets/profile.svg',
                primaryColor: selectedIndex == 1
                    ? AppColor.primaryColor
                    : AppColor.neutral.shade600,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
