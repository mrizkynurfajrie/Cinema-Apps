import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_catalogue/shared/constants/colors.dart';

class LabelSelection extends StatelessWidget {
  const LabelSelection({
    Key? key,
    required this.label,
    required this.onTap,
    required this.selected,
    this.hasNewNotification = false,
  }) : super(key: key);

  final String label;
  final bool selected;
  final bool hasNewNotification;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 12.w,
          vertical: 6.h,
        ),
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12.w)),
          border: Border.all(
            color: selected ? AppColor.primaryColor : AppColor.neutral.shade200,
          ),
        ),
        child: Row(
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: selected
                    ? AppColor.primaryColor
                    : AppColor.neutral.shade600,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
