import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trending_videos/src/features/chat/view/pages/user_list_page.dart';
import 'package:trending_videos/src/features/dashboard/cubits/dashboard_cubit.dart';
import 'package:trending_videos/src/features/home/view/pages/homepage.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  late DashboardCubit dashboardCubit;

  @override
  void initState() {
    dashboardCubit = BlocProvider.of<DashboardCubit>(context);
    super.initState();
  }

  final pages = const [
    Homepage(),
    UserListPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit, DashboardState>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: pages[dashboardCubit.bottomNavigationIndex],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: dashboardCubit.bottomNavigationIndex,
            onTap: (index) {
              dashboardCubit.changeBottomNavigationIndex(index);
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
                tooltip: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.chat),
                label: "Chat",
                tooltip: "Chat",
              ),
            ],
          ),
        );
      },
    );
  }
}
