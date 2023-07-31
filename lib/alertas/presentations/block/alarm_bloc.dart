import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'alarm_event.dart';
import 'alarm_state.dart';

class AlarmBloc extends Bloc<AlarmEvent, AlarmState> {
  AlarmBloc() : super(InitialAlarmState());

  @override
  Stream<AlarmState> mapEventToState(AlarmEvent event) async* {
    print(
        "mapEventToState ha sido llamado con el evento $event"); // Nueva línea
    if (event is AlarmButtonPressed) {
      print("El evento es AlarmButtonPressed"); // Nueva línea
      yield AlarmSendingState();

      try {
        var response = await http.post(
          Uri.parse('http://10.0.2.2:8000/alarma'),
          body: jsonEncode(
              {"email": "yeremi583@gmail.com", "password": "teamopython"}),
          headers: {"Content-Type": "application/json"},
        );

        if (response.statusCode == 200) {
          yield AlarmSentState();
        } else {
          yield AlarmErrorState(response.body);
        }
      } catch (e) {
        yield AlarmErrorState(e.toString());
      }
    }
  }
}
