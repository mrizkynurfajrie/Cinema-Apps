import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_catalogue/shared/constants/colors.dart';
import 'package:movie_catalogue/shared/constants/styles.dart';

class ButtonPrimaryOutline extends StatelessWidget {
  final Function() onPressed;
  final String label;
  final double? width;
  final Color? color;
  final Color? outlineColor;
  final double? elevation;
  final IconData? icon;
  final TextStyle? labelStyle;
  final Color? iconColor;
  final double? height;
  final bool enable;
  final double? borderRadius;

  const ButtonPrimaryOutline({
    Key? key,
    required this.onPressed,
    required this.label,
    this.width,
    this.color,
    this.outlineColor,
    this.elevation,
    this.icon,
    this.labelStyle,
    this.iconColor,
    this.height,
    this.enable = true,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 60.w - 4,
      width: width ?? double.infinity,
      child: ElevatedButton(
        onPressed: enable ? onPressed : null,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          elevation: elevation ?? 1,
          backgroundColor: color ?? AppColor.neutral.shade50,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 0)),
            side: BorderSide(
              color: enable
                  ? outlineColor ?? Theme.of(context).primaryColor
                  : AppColor.neutral.shade300,
              width: 1,
            ),
          ),
        ),
        child: Container(
          height: height ?? 20.w * 2,
          width: width ?? double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 0)),
            color: AppColor.whiteColor,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon != null
                  ? Padding(
                      padding: EdgeInsets.only(right: 4.w),
                      child: Icon(
                        icon!,
                        size: 16.w,
                        color: enable
                            ? Theme.of(context).primaryColor
                            : AppColor.neutral.shade300,
                      ),
                    )
                  : horizontalSpace(0),
              Text(
                label,
                style: labelStyle ??
                    TextStyle(
                      fontSize: 16,
                      color: enable
                          ? Theme.of(context).primaryColor
                          : AppColor.neutral.shade300,
                      fontWeight: FontWeight.w500,
                    ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
