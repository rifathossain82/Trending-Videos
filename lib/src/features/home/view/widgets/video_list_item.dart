import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trending_videos/src/core/extensions/build_context_extension.dart';
import 'package:trending_videos/src/core/extensions/date_time_extension.dart';
import 'package:trending_videos/src/core/services/navigation_services.dart';
import 'package:trending_videos/src/core/utils/color.dart';
import 'package:trending_videos/src/core/widgets/cached_network_image_builder.dart';
import 'package:trending_videos/src/features/home/model/trending_video_model.dart';
import 'package:trending_videos/src/features/video_player/view/pages/video_player_page.dart';

class VideoListItem extends StatelessWidget {
  final TrendingVideoModel video;

  const VideoListItem({
    Key? key,
    required this.video,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        NavigationService.push(
          VideoPlayerPage(video: video),
        );
      },
      child: Container(
        height: 290,
        width: context.screenWidth,
        decoration: BoxDecoration(
          color: kWhite,
        ),
        child: Column(
          children: [
            Expanded(
              child: _ThumbnailWidget(video: video),
            ),
            _ItemFooterWidget(video: video),
          ],
        ),
      ),
    );
  }
}

class _ThumbnailWidget extends StatelessWidget {
  final TrendingVideoModel video;

  const _ThumbnailWidget({
    Key? key,
    required this.video,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        CachedNetworkImageBuilder(
          imgURl: video.thumbnail ?? '',
          borderRadius: BorderRadius.circular(0),
          fit: BoxFit.cover,
        ),
        Positioned(
          right: 7,
          bottom: 5,
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(
              horizontal: 4,
            ),
            decoration: BoxDecoration(
              color: kBlack,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              video.duration ?? '0:00',
              style: GoogleFonts.inter(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: kWhite,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _ItemFooterWidget extends StatelessWidget {
  final TrendingVideoModel video;

  const _ItemFooterWidget({
    Key? key,
    required this.video,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImageBuilder(
            imgURl: video.channelImage ?? '',
            borderRadius: BorderRadius.circular(100),
            height: 40,
            width: 40,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        video.title ?? '',
                        maxLines: 2,
                        textAlign: TextAlign.start,
                        style: GoogleFonts.hindSiliguri(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: kBlackLight,
                        ),
                      ),
                    ),
                    const SizedBox(width: 11),
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {},
                      child: Icon(
                        Icons.more_vert,
                        color: kGreyMedium,
                        size: 24,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  '${video.viewers} views  .   ${video.dateAndTime?.formattedDate}',
                  maxLines: 1,
                  textAlign: TextAlign.start,
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: kGreyTextColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
