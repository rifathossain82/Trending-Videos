import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trending_videos/src/core/enums/app_enum.dart';
import 'package:trending_videos/src/core/helpers/logger.dart';
import 'package:trending_videos/src/core/services/agora_chat_services.dart';
import 'package:trending_videos/src/core/services/snackbar_services.dart';
import 'package:trending_videos/src/core/utils/color.dart';
import 'package:trending_videos/src/features/chat/model/message_model.dart';

part 'chat_event.dart';

part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(const ChatState()) {
    on<UpdateSignedInStatus>(_onUpdateSignedInStatus);
    on<AddMessage>(_onAddMessage);
    on<ClearMessageList>(_onClearMessageList);
  }

  void _onUpdateSignedInStatus(
    UpdateSignedInStatus event,
    Emitter<ChatState> emit,
  ) async {
    try {
      emit(
        state.copyWith(
          isSignedIn: AgoraChatService.isSignedIn(),
        ),
      );
    } catch (e, stackTrace) {
      Log.error('$e', stackTrace: stackTrace);

      SnackBarService.showSnackBar(
        message: '$e',
        bgColor: failedColor,
      );
      emit(
        state.copyWith(
          isSignedIn: false,
        ),
      );
    }
  }

  void _onAddMessage(
    AddMessage event,
    Emitter<ChatState> emit,
  ) async {
    try {
      emit(
        state.copyWith(
          messageList: [...state.messageList, event.message],
        ),
      );
    } catch (e, stackTrace) {
      Log.error('$e', stackTrace: stackTrace);

      SnackBarService.showSnackBar(
        message: '$e',
        bgColor: failedColor,
      );
    }
  }

  void _onClearMessageList(
    ClearMessageList event,
    Emitter<ChatState> emit,
  ) async {
    emit(
      state.copyWith(
        messageList: [],
      ),
    );
  }
}
