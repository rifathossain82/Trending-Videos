import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trending_videos/src/core/services/navigation_services.dart';
import 'package:trending_videos/src/core/utils/asset_path.dart';
import 'package:trending_videos/src/core/utils/color.dart';
import 'package:trending_videos/src/core/widgets/cached_network_image_builder.dart';
import 'package:trending_videos/src/features/home/model/trending_video_model.dart';
import 'package:trending_videos/src/features/video_player/view/widgets/video_player_page_buttons_widget.dart';
import 'package:trending_videos/src/features/video_player/view/widgets/video_player_page_channel_info_widget.dart';
import 'package:trending_videos/src/features/video_player/view/widgets/video_player_page_comments_widget.dart';
import 'package:trending_videos/src/features/video_player/view/widgets/video_player_page_video_info_widget.dart';

class VideoPlayerPage extends StatelessWidget {
  final TrendingVideoModel video;

  const VideoPlayerPage({
    Key? key,
    required this.video,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                _VideoPlayerWidget(video: video),
                const _PositionedBackButton(),
              ],
            ),
            _FlexibleVideoDetailsWidget(video: video),
          ],
        ),
      ),
    );
  }
}

class _VideoPlayerWidget extends StatelessWidget {
  final TrendingVideoModel video;

  const _VideoPlayerWidget({
    Key? key,
    required this.video,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImageBuilder(
      imgURl: video.thumbnail ?? '',
      borderRadius: BorderRadius.circular(0),
      height: 210,
      fit: BoxFit.cover,
    );
  }
}

class _PositionedBackButton extends StatelessWidget {
  const _PositionedBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 10,
      left: 15,
      child: GestureDetector(
        onTap: () => NavigationService.pop(),
        child: SvgPicture.asset(
          AssetPath.backIcon,
          alignment: Alignment.center,
        ),
      ),
    );
  }
}

class _FlexibleVideoDetailsWidget extends StatelessWidget {
  final TrendingVideoModel video;

  const _FlexibleVideoDetailsWidget({
    Key? key,
    required this.video,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: SingleChildScrollView(
        child: ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            VideoPlayerPageVideoInfoWidget(video: video),
            const VideoPlayerPageButtonsWidget(),
            VideoPlayerPageChannelInfoWidget(video: video),
            Divider(height: 1, color: kGreyTextColor),
            const VideoPlayerPageCommentsWidget(),
          ],
        ),
      ),
    );
  }
}
