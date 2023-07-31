import 'package:equatable/equatable.dart';

abstract class ChatState extends Equatable {
  const ChatState();

  @override
  List<Object> get props => [];
}

class MessageSentState extends ChatState {
  final String message;

  MessageSentState(this.message);

  @override
  List<Object> get props => [message];
}

class ChatInitial extends ChatState {
  // Initial state
}

class MessageLoadSuccess extends ChatState {
  final List<String> messages;

  MessageLoadSuccess(this.messages);

  @override
  List<Object> get props => [messages];
}

class MessageLoadFailure extends ChatState {
  // Represents state when messages couldn't be loaded
}
