import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trending_videos/src/core/helpers/helper_methods.dart';
import 'package:trending_videos/src/core/utils/color.dart';
import 'package:trending_videos/src/features/home/model/trending_video_model.dart';

class VideoPlayerPageVideoInfoWidget extends StatelessWidget {
  final TrendingVideoModel video;

  const VideoPlayerPageVideoInfoWidget({
    Key? key,
    required this.video,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            video.title ?? '',
            maxLines: 2,
            textAlign: TextAlign.start,
            style: GoogleFonts.hindSiliguri(
              fontWeight: FontWeight.w600,
              fontSize: 15,
              color: kBlackLight,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '${video.viewers} views  .   ${formatDateTimeDifference(video.dateAndTime ?? DateTime.now())}',
            maxLines: 1,
            textAlign: TextAlign.start,
            style: GoogleFonts.inter(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: kGreyTextColor,
            ),
          )
        ],
      ),
    );
  }
}
