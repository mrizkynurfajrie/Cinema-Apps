import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MenuItemImage extends StatefulWidget {
  final String primaryIcon;
  final Color primaryColor;
  const MenuItemImage({
    Key? key,
    required this.primaryIcon,
    required this.primaryColor,
  }) : super(key: key);

  @override
  State<MenuItemImage> createState() => _MenuItemImageState();
}

class _MenuItemImageState extends State<MenuItemImage> {
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      widget.primaryIcon,
      color: widget.primaryColor,
    );
  }
}
