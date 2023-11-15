import 'package:flutter/material.dart';
import 'package:trending_videos/src/core/services/navigation_services.dart';
import 'package:trending_videos/src/features/chat/model/user_model.dart';
import 'package:trending_videos/src/features/chat/view/pages/chat_page.dart';

class UserListItemWidget extends StatelessWidget {
  final UserModel user;

  const UserListItemWidget({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTapUser,
      leading: const Icon(Icons.person),
      title: Text(user.name),
    );
  }

  void onTapUser() {
    NavigationService.push(
      ChatPage(user: user),
    );
  }
}
