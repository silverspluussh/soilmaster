import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer(
      {super.key, required this.child, this.width, this.height, this.img});
  final Widget child;
  final double? width;
  final double? height;
  final String? img;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          image: img.isNotEmptyAndNotNull
              ? DecorationImage(image: AssetImage(img!), fit: BoxFit.fill)
              : null,
          color: Colors.white,
          borderRadius: BorderRadius.circular(20)),
      child: child,
    ).p4();
  }
}
