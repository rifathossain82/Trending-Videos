import 'package:trending_videos/src/core/enums/app_enum.dart';

class MessageModel {
  final String text;
  final String time;
  final MessagingType type;

  const MessageModel({
    required this.text,
    required this.time,
    required this.type,
  });
}
