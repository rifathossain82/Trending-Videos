import 'package:flutter/material.dart';
import 'package:trending_videos/src/core/extensions/build_context_extension.dart';
import 'package:trending_videos/src/core/services/navigation_services.dart';
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
          Text(
            'Ooops!',
            style: context.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
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
