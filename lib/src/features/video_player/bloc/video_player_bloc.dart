// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:trending_videos/src/features/video_player/bloc/video_player_event.dart';
// import 'package:trending_videos/src/features/video_player/bloc/video_player_state.dart';
// import 'package:video_player/video_player.dart';
//
// class VideoPlayerBloc extends Bloc<VideoPlayerEvent, VideoPlayerState> {
//   late VideoPlayerController _videoPlayerController;
//
//   VideoPlayerState get initialState => VideoPlayerDisposed();
//
//   Stream<VideoPlayerState> mapEventToState(VideoPlayerEvent event) async* {
//     if (event is InitializeVideoPlayer) {
//       yield* _mapInitializeVideoPlayerToState(event);
//     } else if (event is DisposeVideoPlayer) {
//       yield* _mapDisposeVideoPlayerToState();
//     }
//   }
//
//   Stream<VideoPlayerState> _mapInitializeVideoPlayerToState(
//       InitializeVideoPlayer event) async* {
//     try {
//       _videoPlayerController = VideoPlayerController.network(event.videoUrl);
//       await _videoPlayerController.initialize();
//       yield VideoPlayerInitialized(_videoPlayerController);
//     } catch (e) {
//       yield VideoPlayerError('Error initializing video player: $e');
//     }
//   }
//
//   Stream<VideoPlayerState> _mapDisposeVideoPlayerToState() async* {
//     _videoPlayerController.dispose();
//     yield VideoPlayerDisposed();
//   }
// }