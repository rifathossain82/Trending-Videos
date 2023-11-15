import 'package:agora_chat_sdk/agora_chat_sdk.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trending_videos/src/core/enums/app_enum.dart';
import 'package:trending_videos/src/core/extensions/build_context_extension.dart';
import 'package:trending_videos/src/core/helpers/helper_methods.dart';
import 'package:trending_videos/src/core/services/snackbar_services.dart';
import 'package:trending_videos/src/core/utils/color.dart';
import 'package:trending_videos/src/core/widgets/k_button.dart';
import 'package:trending_videos/src/core/widgets/k_text_form_field_builder.dart';
import 'package:trending_videos/src/features/chat/bloc/chat_bloc.dart';
import 'package:trending_videos/src/features/chat/model/message_model.dart';
import 'package:trending_videos/src/features/chat/model/user_model.dart';
import 'package:trending_videos/src/features/chat/view/widgets/chat_bubble_widget.dart';

class ChatPage extends StatefulWidget {
  final UserModel user;

  const ChatPage({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  ScrollController scrollController = ScrollController();
  final messageTextController = TextEditingController();
  late ChatBloc chatBloc;

  @override
  void initState() {
    chatBloc = BlocProvider.of<ChatBloc>(context);
    _addChatListener();
    super.initState();
  }

  @override
  void dispose() {
    chatBloc.add(ClearMessageList());
    ChatClient.getInstance.chatManager.removeMessageEvent("UNIQUE_HANDLER_ID");
    ChatClient.getInstance.chatManager.removeEventHandler("UNIQUE_HANDLER_ID");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.user.name),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children: [
            KTextFormFieldBuilder(
              controller: messageTextController,
              labelText: 'Message',
              hintText: 'Enter a message',
              inputAction: TextInputAction.send,
            ),
            const SizedBox(height: 10),
            KButton(
              onPressed: _sendMessage,
              child: Text(
                'Send Message',
                style: context.buttonTextStyle,
              ),
            ),
            Flexible(
              child: BlocBuilder<ChatBloc, ChatState>(
                builder: (context, state) {
                  return ListView.builder(
                    controller: scrollController,
                    itemCount: state.messageList.length,
                    itemBuilder: (_, index) {
                      return ChatBubbleWidget(
                        message: state.messageList[index],
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _addChatListener() {
    ChatClient.getInstance.chatManager.addMessageEvent(
        "UNIQUE_HANDLER_ID",
        ChatMessageEvent(
          onSuccess: (msgId, msg) {
            kPrint('Send message succeed');
          },
          onProgress: (msgId, progress) {
            kPrint('Send message succeed');
          },
          onError: (msgId, msg, error) {
            kPrint(
                'send message failed, code: ${error.code}, desc: ${error.description}');
          },
        ));

    ChatClient.getInstance.chatManager.addEventHandler(
      "UNIQUE_HANDLER_ID",
      ChatEventHandler(onMessagesReceived: onMessagesReceived),
    );
  }

  void _sendMessage() async {
    if (messageTextController.text.isEmpty) {
      SnackBarService.showSnackBar(
        message: "Single chat id or message content is null",
        bgColor: failedColor,
      );
      return;
    }

    var msg = ChatMessage.createTxtSendMessage(
      targetId: widget.user.id,
      content: messageTextController.text,
    );

    ChatClient.getInstance.chatManager.sendMessage(msg);
    addMessage(messageTextController.text, MessagingType.send);

    messageTextController.clear();
  }

  void onMessagesReceived(List<ChatMessage> messages) {
    for (var msg in messages) {
      switch (msg.body.type) {
        case MessageType.TXT:
          {
            ChatTextMessageBody body = msg.body as ChatTextMessageBody;
            addMessage(
              body.content,
              MessagingType.received,
            );
          }
          break;
        case MessageType.IMAGE:
          {
            addMessage(
              "receive image message, from: ${msg.from}",
              MessagingType.received,
            );
          }
          break;
        case MessageType.VIDEO:
          {
            addMessage(
              "receive video message, from: ${msg.from}",
              MessagingType.received,
            );
          }
          break;
        case MessageType.LOCATION:
          {
            addMessage(
              "receive location message, from: ${msg.from}",
              MessagingType.received,
            );
          }
          break;
        case MessageType.VOICE:
          {
            addMessage(
              "receive voice message, from: ${msg.from}",
              MessagingType.received,
            );
          }
          break;
        case MessageType.FILE:
          {
            addMessage(
              "receive image message, from: ${msg.from}",
              MessagingType.received,
            );
          }
          break;
        case MessageType.CUSTOM:
          {
            addMessage(
              "receive custom message, from: ${msg.from}",
              MessagingType.received,
            );
          }
          break;
        case MessageType.CMD:
          {
            /// Receiving command messages does not trigger the `onMessagesReceived` event,
            /// but triggers the `onCmdMessagesReceived` event instead.
          }
          break;
      }
    }
  }

  void addMessage(String text, MessagingType messagingType) {
    chatBloc.add(
      AddMessage(
        MessageModel(text: text, time: _timeString, type: messagingType),
      ),
    );
    scrollController.jumpTo(scrollController.position.maxScrollExtent);
  }

  String get _timeString {
    return '${DateTime.now().minute} : ${DateTime.now().second} PM';
  }
}
