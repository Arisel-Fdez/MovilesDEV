import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

// Definimos los estados del BLoC
abstract class AlarmState {}

class InitialAlarmState extends AlarmState {}

class AlarmSendingState extends AlarmState {}

class AlarmSentState extends AlarmState {}

class AlarmErrorState extends AlarmState {
  final String error;

  AlarmErrorState(this.error);
}
