import 'package:flutter/material.dart';
import 'package:trending_videos/src/core/extensions/build_context_extension.dart';
import 'package:trending_videos/src/core/utils/color.dart';
import 'package:trending_videos/src/core/widgets/cached_network_image_builder.dart';
import 'package:trending_videos/src/core/widgets/k_button.dart';
import 'package:trending_videos/src/features/home/model/trending_video_model.dart';

class VideoPlayerPageChannelInfoWidget extends StatelessWidget {
  final TrendingVideoModel video;

  const VideoPlayerPageChannelInfoWidget({
    Key? key,
    required this.video,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 15,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: ListTile(
              dense: true,
              contentPadding: EdgeInsets.zero,
              leading: CachedNetworkImageBuilder(
                imgURl: video.channelImage ?? "",
                borderRadius: BorderRadius.circular(100),
                height: 40,
                width: 40,
              ),
              title: Text(
                video.channelName ?? '',
                style: context.textTheme.titleSmall?.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: kDarkBlueGrey,
                ),
              ),
              subtitle: Text(
                '${video.channelSubscriber} Subscribers',
                style: context.textTheme.bodySmall?.copyWith(
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                  color: kGreyTextColor,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: KButton(
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add,
                    size: 16,
                    color: kWhite,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Subscribe',
                    style: context.buttonTextStyle,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
