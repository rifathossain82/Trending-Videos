part of 'chat_bloc.dart';

class ChatState extends Equatable {
  const ChatState({
    this.status = Status.initial,
    this.messageList = const <MessageModel>[],
    this.isSignedIn  = false,
  });

  final Status status;
  final List<MessageModel> messageList;
  final bool isSignedIn ;

  ChatState copyWith({
    Status? status,
    List<MessageModel>? messageList,
    bool? isSignedIn ,
  }) {
    return ChatState(
      status: status ?? this.status,
      messageList: messageList ?? this.messageList,
      isSignedIn : isSignedIn  ?? this.isSignedIn ,
    );
  }

  @override
  String toString() {
    return '''ChatState { 
      status: $status,
      messageList: ${messageList.length},
      isSignedIn : $isSignedIn ,
    }''';
  }

  @override
  List<Object> get props => [
        status,
        messageList,
        isSignedIn ,
      ];
}
