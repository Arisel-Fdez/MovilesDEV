import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import '../../../chat/presentations/block/chat.bloc.dart';
import '../../../chat/presentations/block/chat_event.dart';
import '../../../chat/presentations/block/chat_state.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late final ChatBloc chatBloc;
  final TextEditingController _messageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    chatBloc = context.read<ChatBloc>(); // Obteniendo el ChatBloc del contexto.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Chat Screen')),
      body: BlocConsumer<ChatBloc, ChatState>(
        bloc: chatBloc, // Usando el ChatBloc obtenido del contexto.
        listener: (context, state) {
          if (state is MessageSentState) {
            // El mensaje se envió con éxito, limpia el campo de texto.
            _messageController.clear();
          }
        },
        builder: (context, state) {
          // Obtén los mensajes del estado actual del ChatBloc.
          List<String> messages = [];
          if (state is MessageSentState) {
            messages.add(state.message);
          }

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(messages[index]),
                    );
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _messageController,
                        decoration: InputDecoration(
                          hintText: 'Type a message...',
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.send),
                      onPressed: () {
                        // Send button pressed
                        chatBloc.add(
                          SendMessageEvent(_messageController.text),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
