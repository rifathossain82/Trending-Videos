import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trending_videos/src/core/services/agora_chat_services.dart';
import 'package:trending_videos/src/core/utils/agora_chat_config.dart';
import 'package:trending_videos/src/features/chat/bloc/chat_bloc.dart';
import 'package:trending_videos/src/features/chat/view/widgets/sign_in_request_widget.dart';
import 'package:trending_videos/src/features/chat/view/widgets/user_list_item_widget.dart';

class UserListPage extends StatefulWidget {
  const UserListPage({Key? key}) : super(key: key);

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  ScrollController scrollController = ScrollController();
  late ChatBloc chatBloc;

  @override
  void initState() {
    chatBloc = BlocProvider.of<ChatBloc>(context)..add(UpdateSignedInStatus());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatBloc, ChatState>(builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Chat Page'),
          actions: [
            if (state.isSignedIn)
              IconButton(
                onPressed: _onSignOut,
                icon: const Icon(
                  Icons.logout,
                ),
              ),
          ],
        ),
        body: state.isSignedIn
            ? ListView.builder(
                controller: scrollController,
                itemCount: userList.length,
                itemBuilder: (_, index) {
                  if (userList[index].id == AgoraChatService.currentUserId()) {
                    return const SizedBox();
                  }

                  return UserListItemWidget(
                    user: userList[index],
                  );
                },
              )
            : const SignInRequestWidget(),
      );
    });
  }

  void _onSignOut() async {
    await AgoraChatService.signOut();
    chatBloc.add(UpdateSignedInStatus());
  }
}
