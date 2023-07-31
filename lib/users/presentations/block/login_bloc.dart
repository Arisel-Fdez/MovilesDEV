import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginBloc() : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is EmailChanged) {
      yield* _mapEmailChangedToState(event.email);
    } else if (event is PasswordChanged) {
      yield* _mapPasswordChangedToState(event.password);
    } else if (event is LoginButtonPressed) {
      yield* _mapLoginButtonPressedToState();
    }
  }

  Stream<LoginState> _mapEmailChangedToState(String email) async* {
    yield state; // Mantiene el estado actual
  }

  Stream<LoginState> _mapPasswordChangedToState(String password) async* {
    yield state; // Mantiene el estado actual
  }

  Stream<LoginState> _mapLoginButtonPressedToState() async* {
    yield LoginLoading();
    final isEmailValid =
        RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
            .hasMatch(emailController.text);
    final isPasswordValid = passwordController.text.length >= 8;
    if (isEmailValid && isPasswordValid) {
      final loginResponse =
          await _loginUser(emailController.text, passwordController.text);
      if (loginResponse != null && loginResponse['access_token'] != null) {
        yield LoginSuccess(loginResponse['access_token']);
      } else {
        yield LoginError('Login failed');
      }
    } else {
      yield LoginError('Invalid credentials',
          isEmailValid: isEmailValid, isPasswordValid: isPasswordValid);
    }
  }

  Future<Map<String, dynamic>?> _loginUser(
      String email, String password) async {
    const url = 'http://10.11.1.100:8000/login';
    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return null;
    }
  }

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }
}
