import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trending_videos/src/core/utils/color.dart';
import 'package:trending_videos/src/features/dashboard/model/bottom_navigation_bar_item_model.dart';

class BottomNavigationItemWidget extends StatelessWidget {
  final BottomNavigationBarItemModel bottomNavigationBarItem;
  final bool isActive;
  final VoidCallback onTap;

  const BottomNavigationItemWidget({
    Key? key,
    required this.bottomNavigationBarItem,
    required this.isActive,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: 46,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              isActive
                  ? bottomNavigationBarItem.activeIconPath
                  : bottomNavigationBarItem.inactiveIconPath,
              height: 24,
              width: 24,
              color: isActive ? kPrimaryColor : kGreyTextColor,
            ),
            const SizedBox(height: 8.5),
            Text(
              bottomNavigationBarItem.title,
              style: GoogleFonts.inter(
                fontSize: 10,
                fontWeight: FontWeight.w400,
                color: isActive ? kDarkBlueGrey : kGreyTextColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
