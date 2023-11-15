import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trending_videos/src/core/services/navigation_services.dart';
import 'package:trending_videos/src/core/utils/asset_path.dart';
import 'package:trending_videos/src/core/utils/color.dart';
import 'package:trending_videos/src/features/home/model/trending_video_model.dart';
import 'package:trending_videos/src/features/video_player/cubit/video_player_cubit.dart';
import 'package:trending_videos/src/features/video_player/view/widgets/video_player_page_buttons_widget.dart';
import 'package:trending_videos/src/features/video_player/view/widgets/video_player_page_channel_info_widget.dart';
import 'package:trending_videos/src/features/video_player/view/widgets/video_player_page_comments_widget.dart';
import 'package:trending_videos/src/features/video_player/view/widgets/video_player_page_video_info_widget.dart';
import 'package:trending_videos/src/features/video_player/view/widgets/video_player_widget.dart';

class VideoPlayerPage extends StatefulWidget {
  final TrendingVideoModel video;

  const VideoPlayerPage({
    Key? key,
    required this.video,
  }) : super(key: key);

  @override
  State<VideoPlayerPage> createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  late final VideoPlayerCubit videoPlayerCubit;

  @override
  void initState() {
    videoPlayerCubit = BlocProvider.of<VideoPlayerCubit>(context)
      ..initializeVideoPlayer(widget.video.manifest ?? '');
    super.initState();
  }

  @override
  void dispose() {
    videoPlayerCubit.disposeVideoPlayer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                VideoPlayerWidget(video: widget.video),
                const _PositionedBackButton(),
              ],
            ),
            Flexible(
              child: _VideoDetailsWidget(video: widget.video),
            ),
          ],
        ),
      ),
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

class _VideoDetailsWidget extends StatelessWidget {
  final TrendingVideoModel video;

  const _VideoDetailsWidget({
    Key? key,
    required this.video,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
    );
  }
}
