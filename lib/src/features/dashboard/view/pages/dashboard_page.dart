import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trending_videos/src/core/utils/asset_path.dart';
import 'package:trending_videos/src/features/chat/view/pages/user_list_page.dart';
import 'package:trending_videos/src/features/dashboard/bloc/dashboard_bloc.dart';
import 'package:trending_videos/src/features/dashboard/model/bottom_navigation_bar_item_model.dart';
import 'package:trending_videos/src/features/dashboard/view/widgets/dashboard_bottom_navigation_bar.dart';
import 'package:trending_videos/src/features/home/view/pages/homepage.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  late DashboardBloc dashboardBloc;

  @override
  void initState() {
    dashboardBloc = BlocProvider.of<DashboardBloc>(context);
    super.initState();
  }

  final pages = const [
    Homepage(),
    UserListPage(),
  ];

  final bottomNavigationBarItems = const <BottomNavigationBarItemModel>[
    BottomNavigationBarItemModel(
      activeIconPath: AssetPath.homeActiveIcon,
      inactiveIconPath: AssetPath.homeInactiveIcon,
      title: 'Home',
    ),
    BottomNavigationBarItemModel(
      activeIconPath: AssetPath.chatActiveIcon,
      inactiveIconPath: AssetPath.chatInactiveIcon,
      title: 'Chat',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: pages[state.bottomNavigationIndex],
          ),
          bottomNavigationBar: DashboardBottomNavigationBar(
            dashboardBloc: dashboardBloc,
            dashboardState: state,
            bottomNavigationBarItems: bottomNavigationBarItems,
          ),
        );
      },
    );
  }
}
