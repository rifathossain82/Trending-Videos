part of 'home_bloc.dart';

class HomeState extends Equatable {
  const HomeState({
    this.status = Status.initial,
    this.message = '',
    this.trendingVideos = const <TrendingVideoModel>[],
    this.hasReachedMax = false,
    this.pageNumber = 0,
  });

  final Status status;
  final String message;
  final List<TrendingVideoModel> trendingVideos;
  final bool hasReachedMax;
  final int pageNumber;

  HomeState copyWith({
    Status? status,
    String? message,
    List<TrendingVideoModel>? trendingVideos,
    bool? hasReachedMax,
    int? pageNumber,
  }) {
    return HomeState(
      status: status ?? this.status,
      message: message ?? this.message,
      trendingVideos: trendingVideos ?? this.trendingVideos,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      pageNumber: pageNumber ?? this.pageNumber,
    );
  }

  @override
  String toString() {
    return '''HomeState { 
      status: $status, 
      message: $message,
      trendingVideos: ${trendingVideos.length},
      hasReachedMax: $hasReachedMax,
      pageNumber: $pageNumber,
    }''';
  }

  @override
  List<Object> get props => [
        status,
        message,
        trendingVideos,
        hasReachedMax,
        pageNumber,
      ];
}
