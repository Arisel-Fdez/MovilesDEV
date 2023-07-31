import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../block/alarm_bloc.dart';
import '../block/alarm_event.dart';
import '../block/alarm_state.dart';

class AlarmPage extends StatelessWidget {
  const AlarmPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alarma'),
      ),
      body: BlocConsumer<AlarmBloc, AlarmState>(
        listener: (context, state) {
          if (state is AlarmSentState) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text('Alarma Activada'),
                content: Text('La alarma ha sido activada.'),
                actions: <Widget>[
                  TextButton(
                    child: Text('Ok'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            );
          } else if (state is AlarmErrorState) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text('Error'),
                content: Text('Hubo un error: ${state.error}'),
                actions: <Widget>[
                  TextButton(
                    child: Text('Ok'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is AlarmSendingState) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Center(
              child: ElevatedButton(
                onPressed: () => BlocProvider.of<AlarmBloc>(context)
                    .add(AlarmButtonPressed()),
                child: Text('Activar Alarma'),
              ),
            );
          }
        },
      ),
    );
  }
}
