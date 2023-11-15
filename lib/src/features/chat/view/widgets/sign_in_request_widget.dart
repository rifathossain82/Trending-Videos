import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trending_videos/src/core/extensions/build_context_extension.dart';
import 'package:trending_videos/src/core/services/navigation_services.dart';
import 'package:trending_videos/src/core/utils/asset_path.dart';
import 'package:trending_videos/src/core/widgets/k_button.dart';
import 'package:trending_videos/src/features/auth/view/pages/sign_in_page.dart';

class SignInRequestWidget extends StatelessWidget {
  const SignInRequestWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AssetPath.robotIcon,
            height: context.screenHeight * 0.27,
            width: context.screenWidth,
            alignment: Alignment.center,
          ),
          Text(
            'You are not signed in',
            style: context.textTheme.bodySmall,
          ),
          const SizedBox(height: 20),
          KButton(
            onPressed: () => NavigationService.push(const SignInPage()),
            width: context.screenWidth * 0.4,
            borderRadius: 100,
            child: Text(
              'Sign In',
              style: context.buttonTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}
