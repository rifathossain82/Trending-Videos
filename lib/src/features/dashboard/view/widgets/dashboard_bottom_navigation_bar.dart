import 'package:flutter/material.dart';
import 'package:trending_videos/src/core/utils/color.dart';
import 'package:trending_videos/src/features/dashboard/bloc/dashboard_bloc.dart';
import 'package:trending_videos/src/features/dashboard/model/bottom_navigation_bar_item_model.dart';
import 'package:trending_videos/src/features/dashboard/view/widgets/bottom_navigation_item_widget.dart';

class DashboardBottomNavigationBar extends StatelessWidget {
  final DashboardBloc dashboardBloc;
  final DashboardState dashboardState;
  final List<BottomNavigationBarItemModel> bottomNavigationBarItems;

  const DashboardBottomNavigationBar({
    Key? key,
    required this.dashboardBloc,
    required this.dashboardState,
    required this.bottomNavigationBarItems,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: kWhite,
        border: Border(
          top: BorderSide(
            color: Colors.grey.shade300,
            width: 1,
          ),
        ),
      ),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: bottomNavigationBarItems.length,
        itemBuilder: (context, index) => BottomNavigationItemWidget(
          bottomNavigationBarItem: bottomNavigationBarItems[index],
          isActive: dashboardState.bottomNavigationIndex == index,
          onTap: () => dashboardBloc.add(
            ChangeBottomNavigationIndex(index),
          ),
        ),
        separatorBuilder: (context, index) => const SizedBox(width: 30),
      ),
    );
  }
}
