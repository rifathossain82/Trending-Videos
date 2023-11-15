import 'package:chewie/chewie.dart';

abstract class VideoPlayerState {}

class VideoPlayerInitialized extends VideoPlayerState {
  final ChewieController chewieController;

  VideoPlayerInitialized(this.chewieController);
}

class VideoPlayerDisposed extends VideoPlayerState {}

class VideoPlayerError extends VideoPlayerState {
  final String error;

  VideoPlayerError(this.error);
}