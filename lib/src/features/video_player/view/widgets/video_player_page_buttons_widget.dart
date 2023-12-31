import 'package:flutter/material.dart';
import 'package:trending_videos/src/core/utils/asset_path.dart';
import 'package:trending_videos/src/features/video_player/view/widgets/video_player_page_icon_button.dart';

class VideoPlayerPageButtonsWidget extends StatelessWidget {
  const VideoPlayerPageButtonsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: VideoPlayerPageIconButton(
              svgIcon: AssetPath.favoriteIcon,
              title: 'MASHALLAH (12k)',
              onTap: () {},
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            flex: 1,
            child: VideoPlayerPageIconButton(
              svgIcon: AssetPath.likeIcon,
              title: 'LIKE (12k)',
              onTap: () {},
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            flex: 1,
            child: VideoPlayerPageIconButton(
              svgIcon: AssetPath.shareIcon,
              title: 'SHARE',
              onTap: () {},
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            flex: 1,
            child: VideoPlayerPageIconButton(
              svgIcon: AssetPath.reportIcon,
              title: 'REPORT',
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
