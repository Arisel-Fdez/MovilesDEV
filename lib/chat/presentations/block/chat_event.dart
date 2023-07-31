import 'package:equatable/equatable.dart';

abstract class ChatEvent extends Equatable {
  const ChatEvent();

  @override
  List<Object> get props => [];
}

class SendMessageEvent extends ChatEvent {
  final String message;

  SendMessageEvent(this.message);

  @override
  List<Object> get props => [message];
}

class LoadInitialMessagesEvent extends ChatEvent {
  // Use this event if you need to load initial messages from the server
}
