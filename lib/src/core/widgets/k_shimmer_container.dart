import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:trending_videos/src/core/utils/color.dart';

class KShimmerContainer extends StatelessWidget {
  final double height;
  final double width;
  final double borderRadius;
  final BoxShape shape;
  final EdgeInsetsGeometry? margin;

  const KShimmerContainer({
    Key? key,
    this.height = 100,
    this.width = double.infinity,
    this.borderRadius = 0,
    this.shape = BoxShape.rectangle,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: kShimmerBaseColor,
      highlightColor: kShimmerHighlightColor,
      period: const Duration(seconds: 1),
      child: Container(
        height: height,
        width: width,
        margin: margin,
        decoration: BoxDecoration(
          color: kWhite,
          shape: shape,
          borderRadius: shape == BoxShape.rectangle
              ? BorderRadius.circular(borderRadius)
              : null,
        ),
      ),
    );
  }
}
