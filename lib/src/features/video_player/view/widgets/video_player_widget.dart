import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trending_videos/src/core/widgets/cached_network_image_builder.dart';
import 'package:trending_videos/src/core/widgets/failure_widget_builder.dart';
import 'package:trending_videos/src/features/home/model/trending_video_model.dart';
import 'package:trending_videos/src/features/video_player/bloc/video_player_cubit.dart';
import 'package:trending_videos/src/features/video_player/bloc/video_player_state.dart';

class VideoPlayerWidget extends StatelessWidget {
  final TrendingVideoModel video;

  const VideoPlayerWidget({
    Key? key,
    required this.video,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 210,
      decoration: const BoxDecoration(
        color: Colors.black,
      ),
      child: BlocBuilder<VideoPlayerCubit, VideoPlayerState>(
        builder: (context, state) {
          if (state is VideoPlayerInitialized) {
            return _ChewieVideoPlayerWidget(controller: state.chewieController);
          } else if (state is VideoPlayerError) {
            return const FailureWidgetBuilder();
          } else {
            return _VideoPlayerLoadingWidget(video: video);
          }
        },
      ),
    );
  }
}

class _ChewieVideoPlayerWidget extends StatelessWidget {
  final ChewieController controller;

  const _ChewieVideoPlayerWidget({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Chewie(controller: controller);
  }
}

class _VideoPlayerLoadingWidget extends StatelessWidget {
  final TrendingVideoModel video;

  const _VideoPlayerLoadingWidget({
    Key? key,
    required this.video,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImageBuilder(
      imgURl: video.thumbnail ?? '',
      borderRadius: BorderRadius.circular(0),
      fit: BoxFit.cover,
    );
  }
}
