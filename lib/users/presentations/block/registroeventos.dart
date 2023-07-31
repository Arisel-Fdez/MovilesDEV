import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:equatable/equatable.dart'; // Agrega esta línea de importación

class RegistrationEvent extends Equatable {
  final String name;
  final String email;
  final String password;
  final String phone;

  RegistrationEvent({
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
  });

  @override
  List<Object?> get props => [name, email, password, phone];
}

// Estados para el proceso de registro
abstract class RegistrationState extends Equatable {
  @override
  List<Object?> get props => [];
}

class RegistrationInitial extends RegistrationState {}

class RegistrationLoading extends RegistrationState {}

class RegistrationSuccess extends RegistrationState {}

class RegistrationError extends RegistrationState {
  final String message;

  RegistrationError({required this.message});

  @override
  List<Object?> get props => [message];
}

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  RegistrationBloc() : super(RegistrationInitial());

  @override
  Stream<RegistrationState> mapEventToState(RegistrationEvent event) async* {
    if (event is RegistrationEvent) {
      yield RegistrationLoading();

      try {
        // Realizar la solicitud HTTP aquí y procesar la respuesta del servidor
        String url = 'http://10.11.1.100:8000/users';
        Map<String, String> headers = {
          'Content-Type': 'application/json',
        };
        Map<String, dynamic> body = {
          'name': event.name,
          'email': event.email,
          'password': event.password,
          'phone': event.phone,
        };

        http.Response response = await http.post(
          Uri.parse(url),
          headers: headers,
          body: jsonEncode(body),
        );

        if (response.statusCode == 200) {
          // Registro exitoso
          yield RegistrationSuccess();
        } else {
          // Registro fallido
          yield RegistrationError(
              message: 'Registro fallido. Inténtalo nuevamente.');
        }
      } catch (e) {
        // Manejo de errores
        yield RegistrationError(message: 'Error en el registro: $e');
      }
    }
  }
}
