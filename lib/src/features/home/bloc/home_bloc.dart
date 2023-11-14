import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trending_videos/src/core/enums/app_enum.dart';
import 'package:trending_videos/src/core/helpers/logger.dart';
import 'package:trending_videos/src/core/network/api.dart';
import 'package:trending_videos/src/core/network/network_utils.dart';
import 'package:trending_videos/src/core/services/snackbar_services.dart';
import 'package:trending_videos/src/core/utils/color.dart';
import 'package:trending_videos/src/features/home/model/trending_video_model.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<GetTrendingVideos>(_onGetTrendingVideos);
    on<ReloadTrendingVideos>(_onReloadTrendingVideos);
  }

  void _onGetTrendingVideos(
    GetTrendingVideos event,
    Emitter<HomeState> emit,
  ) async {
    if (state.hasReachedMax) return;

    try {
      final int nextPageNumber = state.pageNumber + 1;

      final Map<String, dynamic> params = {
        'page': '$nextPageNumber',
      };

      dynamic responseBody = await Network.handleResponse(
        await Network.getRequest(
          api: Api.trendingVideos,
          params: params,
        ),
      );

      final List<TrendingVideoModel> trendingVideos = [];
      if (responseBody != null) {
        for (var videoJson in responseBody['results']) {
          trendingVideos.add(TrendingVideoModel.fromJson(videoJson));
        }
      }

      emit(
        state.copyWith(
          trendingVideos: [...state.trendingVideos, ...trendingVideos],
          status: Status.success,
          hasReachedMax: responseBody["links"]["next"] == null,
          pageNumber: nextPageNumber,
        ),
      );
    } catch (e, stackTrace) {
      Log.error('$e', stackTrace: stackTrace);

      SnackBarService.showSnackBar(
        message: '$e',
        bgColor: failedColor,
      );

      emit(
        state.copyWith(
          status: Status.failure,
          message: '$e',
        ),
      );
    }
  }

  void _onReloadTrendingVideos(
    ReloadTrendingVideos event,
    Emitter<HomeState> emit,
  ) async {
    emit(
      state.copyWith(
        pageNumber: 0,
        trendingVideos: [],
        status: Status.loading,
        hasReachedMax: false,
      ),
    );

    add(GetTrendingVideos());
  }
}
