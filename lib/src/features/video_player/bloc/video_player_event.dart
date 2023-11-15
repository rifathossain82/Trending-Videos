abstract class VideoPlayerEvent {}

class InitializeVideoPlayer extends VideoPlayerEvent {
  final String videoUrl;

  InitializeVideoPlayer(this.videoUrl);
}

class DisposeVideoPlayer extends VideoPlayerEvent {}