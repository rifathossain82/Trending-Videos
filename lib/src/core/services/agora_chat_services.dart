import 'package:agora_chat_sdk/agora_chat_sdk.dart';
import 'package:trending_videos/src/core/services/snackbar_services.dart';
import 'package:trending_videos/src/core/utils/agora_chat_config.dart';
import 'package:trending_videos/src/core/utils/color.dart';
import 'package:collection/collection.dart';
import 'package:trending_videos/src/features/chat/model/user_model.dart';

class AgoraChatService {
  static Future<void> initSDK() async {
    ChatOptions options = ChatOptions(
      appKey: AgoraChatConfig.appKey,
      autoLogin: false,
    );
    await ChatClient.getInstance.init(options);
    await ChatClient.getInstance.startCallback();
  }

  static String? currentUserId() {
    return ChatClient.getInstance.currentUserId;
  }

  static bool isSignedIn() {
    var currentUserId = ChatClient.getInstance.currentUserId;
    if (currentUserId != null) {
      return true;
    } else {
      return false;
    }
  }

  static Future<void> signIn({required String userId}) async {
    try {
      UserModel? user = userList.firstWhereOrNull(
        (user) => user.id == userId,
      );

      if (user != null) {
        await ChatClient.getInstance
            .loginWithAgoraToken(
          userId,
          user.token,
        )
            .then((value) {
          SnackBarService.showSnackBar(
            message: "Sign in succeed, userId: $userId",
            bgColor: successColor,
          );
        });
      } else {
        SnackBarService.showSnackBar(
          message: "Invalid User Id!",
          bgColor: successColor,
        );
      }
    } on ChatError catch (e) {
      SnackBarService.showSnackBar(
        message: "Sign in failed, code: ${e.code}, desc: ${e.description}",
        bgColor: failedColor,
      );
    }
  }

  static Future<void> signOut() async {
    try {
      await ChatClient.getInstance.logout(true).then((value) {
        SnackBarService.showSnackBar(
          message: "Sign out succeed!",
          bgColor: successColor,
        );
      });
    } on ChatError catch (e) {
      SnackBarService.showSnackBar(
        message: "Sign out failed, code: ${e.code}, desc: ${e.description}",
        bgColor: failedColor,
      );
    }
  }
}
