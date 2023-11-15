part of 'chat_bloc.dart';

abstract class ChatEvent extends Equatable {
  const ChatEvent();
}

class UpdateSignedInStatus extends ChatEvent {
  @override
  List<Object?> get props => [];
}

class AddMessage extends ChatEvent {
  final MessageModel message;

  const AddMessage(this.message);

  @override
  List<Object?> get props => [message];
}

class ClearMessageList extends ChatEvent {
  @override
  List<Object?> get props => [];
}
