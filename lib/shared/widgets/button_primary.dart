import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_catalogue/shared/constants/colors.dart';
import 'package:movie_catalogue/shared/constants/styles.dart';

class ButtonPrimary extends StatelessWidget {
  const ButtonPrimary(
      {Key? key,
      required this.onPressed,
      required this.label,
      this.size,
      this.color,
      this.labelStyle,
      this.height,
      this.margin,
      this.padding,
      this.enable = true,
      this.icon,
      this.iconSize,
      this.iconColor,
      this.cornerRadius,
      this.borderColor})
      : super(key: key);

  final Function() onPressed;
  final Color? color;
  final bool enable;
  final double? height;
  final IconData? icon;
  final double? iconSize;
  final Color? iconColor;
  final String label;
  final TextStyle? labelStyle;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final double? size;
  final double? cornerRadius;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: margin ?? EdgeInsets.zero,
        padding: padding ?? EdgeInsets.zero,
        height: height ?? 60.w - 6,
        width: size ?? double.infinity,
        child: ElevatedButton(
            onPressed: enable ? onPressed : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: enable
                  ? color ?? Theme.of(context).primaryColor
                  : AppColor.neutral.shade300,
              shape: RoundedRectangleBorder(
                  borderRadius: cornerRadius != null
                      ? BorderRadius.all(Radius.circular(cornerRadius!))
                      : BorderRadius.all(Radius.circular(24.w)) * 2,
                  side: BorderSide(
                      color: borderColor ?? AppColor.transparentColor)),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  label,
                  style: labelStyle ??
                      const TextStyle(
                        fontSize: 16,
                        color: AppColor.whiteColor,
                        fontWeight: FontWeight.w500,
                      ),
                  textAlign: TextAlign.center,
                ),
                icon != null
                    ? Padding(
                        padding: EdgeInsets.only(left: 4.w),
                        child: Icon(
                          icon!,
                          size: iconSize ?? 16.w,
                          color: iconColor ?? null,
                        ),
                      )
                    : horizontalSpace(0),
              ],
            )));
  }
}
