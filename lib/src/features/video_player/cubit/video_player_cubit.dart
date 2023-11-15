import 'package:chewie/chewie.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trending_videos/src/features/video_player/cubit/video_player_state.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerCubit extends Cubit<VideoPlayerState> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;

  VideoPlayerCubit() : super(VideoPlayerDisposed());

  Future<void> initializeVideoPlayer(String videoUrl) async {
    try {
      _videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(videoUrl));
      await _videoPlayerController.initialize();
      _chewieController = ChewieController(
        videoPlayerController: _videoPlayerController,
        autoPlay: true,
        looping: false,
      );
      emit(VideoPlayerInitialized(_chewieController));
    } catch (e) {
      emit(VideoPlayerError('Error initializing video player: $e'));
    }
  }

  Future<void> pauseVideoPlayer() async {
    _chewieController.pause();
    emit(VideoPlayerInitialized(_chewieController));
  }

  Future<void> playVideoPlayer() async {
    _chewieController.play();
    emit(VideoPlayerInitialized(_chewieController));
  }

  void disposeVideoPlayer() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    emit(VideoPlayerDisposed());
  }
}