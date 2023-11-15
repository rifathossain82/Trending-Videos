import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:trending_videos/src/core/enums/app_enum.dart';
import 'package:trending_videos/src/features/chat/model/message_model.dart';

class ChatBubbleWidget extends StatelessWidget {
  final MessageModel message;

  const ChatBubbleWidget({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChatBubble(
      clipper: ChatBubbleClipper4(
        type: message.type == MessagingType.send
            ? BubbleType.sendBubble
            : BubbleType.receiverBubble,
      ),
      alignment: message.type == MessagingType.send
          ? Alignment.topRight
          : Alignment.topLeft,
      margin: const EdgeInsets.only(top: 4),
      backGroundColor: Colors.blue,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.7,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              message.text,
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 2),
            if (message.time.isNotEmpty)
              Text(
                message.time,
                textAlign: TextAlign.end,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 9,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
