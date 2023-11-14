import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trending_videos/src/core/extensions/build_context_extension.dart';
import 'package:trending_videos/src/core/extensions/date_time_extension.dart';
import 'package:trending_videos/src/core/utils/color.dart';
import 'package:trending_videos/src/core/widgets/cached_network_image_builder.dart';
import 'package:trending_videos/src/features/home/model/trending_video_model.dart';

class VideoItemWidget extends StatelessWidget {
  final TrendingVideoModel video;

  const VideoItemWidget({
    Key? key,
    required this.video,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.screenHeight * 0.42,
      width: context.screenWidth,
      decoration: BoxDecoration(
        color: kWhite,
      ),
      child: Column(
        children: [
          CachedNetworkImageBuilder(
            imgURl: video.thumbnail ?? '',
            borderRadius: BorderRadius.circular(0),
            height: context.screenHeight * 0.26,
            fit: BoxFit.cover,
          ),
          ListTile(
            contentPadding: const EdgeInsets.all(16),
            dense: true,
            leading: CachedNetworkImageBuilder(
              imgURl: video.channelImage ?? '',
              borderRadius: BorderRadius.circular(100),
              height: 40,
              width: 40,
            ),
            title: Text(
              video.title ?? '',
              maxLines: 2,
              textAlign: TextAlign.start,
              style: GoogleFonts.hindSiliguri(
                fontWeight: FontWeight.w600,
                fontSize: 15,
                color: kBlackLight,
              ),
            ),
            isThreeLine: true,
            subtitle: Text(
              '${video.viewers} views  .   ${video.dateAndTime?.formattedDate}',
              maxLines: 1,
              textAlign: TextAlign.start,
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.more_vert,
                color: kGreyMedium,
                size: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
