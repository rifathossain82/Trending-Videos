import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trending_videos/src/core/extensions/build_context_extension.dart';
import 'package:trending_videos/src/core/utils/color.dart';

class VideoPlayerPageIconButton extends StatelessWidget {
  final String svgIcon;
  final String title;
  final VoidCallback onTap;

  const VideoPlayerPageIconButton({
    Key? key,
    required this.svgIcon,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(
          vertical: 8,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: kGrey.withOpacity(0.3),
          ),
        ),
        child: Column(
          children: [
            SvgPicture.asset(
              svgIcon,
              color: kGreyTextColor,
            ),
            Text(
              title,
              style: context.textTheme.bodySmall?.copyWith(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: kGreyTextColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
