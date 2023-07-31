import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

// Definimos los eventos del BLoC
abstract class AlarmEvent {}

class AlarmButtonPressed extends AlarmEvent {}
