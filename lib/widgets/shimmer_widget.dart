import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  final double width;
  final double height;
  final ShapeBorder shapeBorder;

  const ShimmerWidget.rectangular({
    super.key,
    required this.width,
    required this.height,
  }) : shapeBorder = const RoundedRectangleBorder();

  const ShimmerWidget.circular({
    super.key,
    required this.width,
    required this.height,
  }) : shapeBorder = const CircleBorder();

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: width,
        height: height,
        decoration: ShapeDecoration(
          color: Colors.grey[300]!,
          shape: shapeBorder,
        ),
      ),
    );
  }
}
