import 'package:flutter/material.dart';
import 'package:trending_videos/src/core/widgets/bottom_loader.dart';
import 'package:trending_videos/src/features/home/bloc/home_bloc.dart';
import 'package:trending_videos/src/features/home/view/widgets/video_item_widget.dart';

class VideoListWidget extends StatelessWidget {
  final ScrollController scrollController;
  final HomeState state;

  const VideoListWidget({
    Key? key,
    required this.scrollController,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: scrollController,
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.all(15),
      itemCount: state.hasReachedMax
          ? state.trendingVideos.length
          : state.trendingVideos.length + 1,
      itemBuilder: (context, index) {
        return index >= state.trendingVideos.length
            ? const BottomLoader()
            : VideoItemWidget(
                video: state.trendingVideos[index],
              );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 10),
    );
  }
}
