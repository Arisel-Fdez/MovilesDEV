import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'usuario.dart';
import 'usuario_event.dart';
import 'usuario_state.dart';

class ListaUsuarioBloc extends Bloc<UsuarioEvent, UsuarioState> {
  ListaUsuarioBloc() : super(UsuarioInitial());

  @override
  Stream<UsuarioState> mapEventToState(UsuarioEvent event) async* {
    if (event is ObtenerUsuarios) {
      yield UsuarioLoading();
      try {
        final url = Uri.parse('http://10.11.1.100:8000/users/${event.orden}');

        final response = await http.get(url);

        if (response.statusCode == 200) {
          final List<dynamic> data = json.decode(response.body);

          final usuarios = data.map((usuarioData) {
            return Usuario(
              imagenAsset: 'assets/images/perfil.jpg',
              name: usuarioData[1],
              email: usuarioData[2],
              tree: usuarioData[0],
            );
          }).toList();

          yield UsuarioLoaded(usuarios);
        } else {
          yield UsuarioError();
        }
      } catch (_) {
        yield UsuarioError();
      }
    }
  }
}
