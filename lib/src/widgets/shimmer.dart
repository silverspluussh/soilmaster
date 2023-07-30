import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:soilmaster/constants/colors.dart';

class ShimmerWidget extends StatelessWidget {
  final double width;
  final double height;
  final ShapeBorder shapeBorder;

  const ShimmerWidget.rectangular(
      {Key? key, this.width = double.infinity, required this.height})
      : shapeBorder = const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30))),
        super(key: key);

  const ShimmerWidget.circular(
      {Key? key,
      required this.width,
      required this.height,
      this.shapeBorder = const CircleBorder()})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Shimmer.fromColors(
      baseColor: Colors.grey,
      highlightColor: kBlackColor.withOpacity(0.5),
      child: Container(
        margin: const EdgeInsets.all(10),
        height: height,
        width: width,
        decoration: ShapeDecoration(color: Colors.blueGrey, shape: shapeBorder),
      ));
}
