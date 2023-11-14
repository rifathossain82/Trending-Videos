part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class GetTrendingVideos extends HomeEvent {
  @override
  List<Object?> get props => [];
}

class ReloadTrendingVideos extends HomeEvent {
  @override
  List<Object?> get props => [];
}