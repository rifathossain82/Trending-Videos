import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trending_videos/src/core/enums/app_enum.dart';
import 'package:trending_videos/src/core/widgets/failure_widget_builder.dart';
import 'package:trending_videos/src/features/home/bloc/home_bloc.dart';
import 'package:trending_videos/src/features/home/view/widgets/homepage_loading_widget.dart';
import 'package:trending_videos/src/features/home/view/widgets/video_list_widget.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final ScrollController _scrollController = ScrollController();
  late HomeBloc homeBloc;

  @override
  void initState() {
    homeBloc = BlocProvider.of<HomeBloc>(context)..add(ReloadTrendingVideos());

    scrollIndicator();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void scrollIndicator() {
    _scrollController.addListener(
      () {
        if (_scrollController.offset >=
                _scrollController.position.maxScrollExtent &&
            !_scrollController.position.outOfRange) {
          if (!homeBloc.state.hasReachedMax) {
            homeBloc.add(GetTrendingVideos());
          }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trending Videos'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          homeBloc.add(ReloadTrendingVideos());
        },
        child: Stack(
          children: [
            ListView(),
            BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                return state.status == Status.failure
                    ? const FailureWidgetBuilder()
                    : state.status == Status.success
                        ? state.trendingVideos.isEmpty
                            ? const FailureWidgetBuilder()
                            : VideoListWidget(
                                scrollController: _scrollController,
                                state: state,
                              )
                        : const HomepageLoadingWidget();
              },
            ),
          ],
        ),
      ),
    );
  }
}
