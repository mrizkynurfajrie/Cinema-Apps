import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:movie_catalogue/features/home/controller_home.dart';
import 'package:movie_catalogue/framework/api1.dart';
import 'package:movie_catalogue/routes/app_routes.dart';
import 'package:movie_catalogue/shared/constants/colors.dart';
import 'package:movie_catalogue/shared/constants/styles.dart';
import 'package:movie_catalogue/shared/widgets/page_decoration_top.dart';
import 'package:shimmer/shimmer.dart';

class PageHome extends GetView<ControllerHome> {
  const PageHome({super.key});

  @override
  Widget build(BuildContext context) {
    return PageDecorationTop(
      title: '',
      resizeAvoidBottom: false,
      toolbarTitleColor: AppColor.whiteColor,
      backgroundColor: AppColor.bgColor,
      toolbarColor: AppColor.primaryColor,
      enableBack: false,
      center: const Center(
        child: Text(
          'Elemes Cinema',
          style: TextStyle(
            fontSize: 16,
            color: AppColor.whiteColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      child: SafeArea(
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Trending today!',
                style: TextStyle(
                    fontSize: 16,
                    color: AppColor.neutral.shade900,
                    fontWeight: FontWeight.bold),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
                width: Get.width,
                height: 170.h,
                child: CarouselSlider(
                  options: CarouselOptions(
                    viewportFraction: 1,
                    initialPage: 0,
                    height: 170.h,
                    enableInfiniteScroll: true,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 5),
                    onPageChanged: (index, reason) {
                      controller.currentSlide.value = index;
                    },
                  ),
                  carouselController: controller.carouselController,
                  items: controller.listBanner
                      .map((Banner) => Container(
                            color: AppColor.transparentColor,
                            width: Get.width,
                            margin: EdgeInsets.zero,
                            child: Column(
                              children: <Widget>[
                                SizedBox(
                                  height: 140.h,
                                  width: Get.width,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: CachedNetworkImage(
                                      imageUrl:
                                          '${Api1().imageUrl}${Banner.backdropPath}',
                                      fit: BoxFit.cover,
                                      progressIndicatorBuilder:
                                          (context, url, downloadProgress) =>
                                              Shimmer(
                                        gradient: AppColor.shimmerGradient,
                                        child: Container(
                                          color: AppColor.whiteColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                verticalSpace(8.h),
                                Text(
                                  Banner.title ?? Banner.name!,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: AppColor.neutral.shade800,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                )
                              ],
                            ),
                          ))
                      .toList(),
                ),
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: controller.listBanner.asMap().entries.map((entry) {
                    return GestureDetector(
                      onTap: () => controller.carouselController
                          .animateToPage(entry.key),
                      child: Container(
                        height: 8,
                        width: 8,
                        margin: EdgeInsets.symmetric(
                          horizontal: 4.w,
                        ),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color:
                              (Theme.of(context).brightness == Brightness.dark
                                      ? Colors.white
                                      : AppColor.primaryColor)
                                  .withOpacity(
                                      controller.currentSlide.value == entry.key
                                          ? 0.9
                                          : 0.4),
                        ),
                      ),
                    );
                  }).toList()),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h),
                child: Divider(
                  thickness: 1,
                  color: AppColor.neutral.shade300,
                ),
              ),
              Text(
                'Find something to watch',
                style: TextStyle(
                    fontSize: 16,
                    color: AppColor.neutral.shade900,
                    fontWeight: FontWeight.bold),
              ),
              verticalSpace(12.h),
              TextFormField(
                enabled: true,
                onTap: () {
                  dismisKeyboard();
                  Get.toNamed(Routes.searchPage);
                  dismisKeyboard();
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  suffixIcon: Icon(Icons.search),
                  hintText: 'Search..',
                ),
              ),
              verticalSpace(16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MenuButtonHome(
                    ontap: () => Get.toNamed(Routes.moviePage),
                    icon: const Icon(
                      Icons.movie,
                      color: Color(0xFF7149C6),
                    ),
                    title: 'Movies',
                  ),
                  MenuButtonHome(
                    ontap: () => Get.toNamed(Routes.tvshowPage),
                    icon: const Icon(
                      Icons.tv,
                      color: Color(0xFFFC2947),
                    ),
                    title: 'TV Shows',
                  ),
                  MenuButtonHome(
                    ontap: () => Get.toNamed(Routes.peoplePage),
                    icon: const Icon(
                      Icons.person,
                      color: Color(0xFF159895),
                    ),
                    title: 'People',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MenuButtonHome extends StatelessWidget {
  final Function() ontap;
  final Widget icon;
  final String title;

  const MenuButtonHome({
    Key? key,
    required this.ontap,
    required this.icon,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardRoundedClickable(
      width: 100.w,
      height: 100.h,
      shadow: [
        BoxShadow(
            color: const Color(0xFF000000).withOpacity(.15),
            spreadRadius: 0,
            blurRadius: 8,
            offset: const Offset(0, 4)),
      ],
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      onTap: ontap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          verticalSpace(8.w),
          Text(
            title,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class CardRoundedClickable extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? borderRadius;
  final double? width;
  final double? height;
  final Color? color;
  final List<BoxShadow>? shadow;
  final Function()? onTap;

  const CardRoundedClickable({
    Key? key,
    required this.child,
    this.padding,
    this.margin,
    this.width,
    this.height,
    this.borderRadius,
    this.color,
    this.shadow,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin ?? EdgeInsets.symmetric(horizontal: 4.w),
      decoration: BoxDecoration(
        boxShadow: shadow ??
            [
              BoxShadow(
                  color: const Color(0xff333333).withOpacity(.15),
                  spreadRadius: 0,
                  blurRadius: 3,
                  offset: const Offset(0, 1)),
            ],
      ),
      child: Material(
        type: MaterialType.card,
        color: color ?? Colors.white,
        borderRadius: borderRadius != null
            ? BorderRadius.all(Radius.circular(borderRadius!))
            : BorderRadius.all(Radius.circular(8.w)),
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: padding ?? EdgeInsets.all(12.w),
            child: child,
          ),
        ),
      ),
    );
  }
}

dismisKeyboard() {
  FocusManager.instance.primaryFocus?.unfocus();
}
