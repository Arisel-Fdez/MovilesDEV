import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'chat_event.dart';
import 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  List<String> messages = [];
  String userEmail =
      'prueba34@gmail.com'; // Aquí debes obtener el email del usuario autenticado
  String userPassword =
      'teamopython'; // Aquí debes obtener la contraseña del usuario autenticado

  ChatBloc() : super(ChatInitial());

  @override
  Stream<ChatState> mapEventToState(ChatEvent event) async* {
    if (event is SendMessageEvent) {
      final response = await http.post(
        Uri.parse('http://10.11.1.100:8000/chat/message'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'user': <String, String>{
            'email': userEmail,
            'password': userPassword,
          },
          'message': <String, String>{
            'message': event.message,
          },
        }),
      );
      if (response.statusCode == 200) {
        // Si el backend devuelve status 200, el mensaje se envió con éxito.
        // Actualizar el estado del ChatBloc con el mensaje enviado.
        messages.add(event.message);
        yield MessageSentState(event.message);
      } else {
        throw Exception('Failed to send message');
      }
    } else if (event is LoadInitialMessagesEvent) {
      // Puedes implementar aquí la carga de mensajes iniciales desde el servidor
    }
  }
}
