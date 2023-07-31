import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/users/presentations/block/usuario.dart';

import '/users/presentations/block/usuario_state.dart';
import '/users/presentations/block/usuario_event.dart';
import '/users/presentations/block/ListaUsuarioScreenBloc.dart';

class ListaUsuarioScreen extends StatelessWidget {
  final ListaUsuarioBloc _listaUsuarioBloc = ListaUsuarioBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ListaUsuarioBloc>(
      create: (context) => _listaUsuarioBloc..add(ObtenerUsuarios('inorden')),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Lista de Usuarios'),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue, Colors.lightBlueAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          actions: [
            PopupMenuButton<String>(
              onSelected: (String orden) {
                _listaUsuarioBloc.add(ObtenerUsuarios(orden));
              },
              child: Row(
                children: [
                  Icon(Icons.sort,
                      color: Colors.white), // Icono postorden en color blanco
                  SizedBox(width: 8),
                ],
              ),
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                PopupMenuItem<String>(
                  value: 'inorden',
                  child: Text('Ordenar por inorden'),
                ),
                PopupMenuItem<String>(
                  value: 'postorden',
                  child: Text('Ordenar por postorden'),
                ),
                PopupMenuItem<String>(
                  value: 'preorden',
                  child: Text('Ordenar por preorden'),
                ),
              ],
            ),
          ],
        ),
        body: BlocBuilder<ListaUsuarioBloc, UsuarioState>(
          builder: (context, state) {
            if (state is UsuarioLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is UsuarioLoaded) {
              return ListView.builder(
                itemCount: state.usuarios.length,
                itemBuilder: (context, index) {
                  return _buildUsuarioItem(state.usuarios[index]);
                },
              );
            } else {
              return Center(child: Text('Ocurrió un error'));
            }
          },
        ),
      ),
    );
  }

  Widget _buildUsuarioItem(Usuario usuario) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(usuario.imagenAsset), // Imagen local
        ),
        title: Text(
          usuario.name, // Usar la propiedad correcta: name
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 4),
            Text(
              'Correo: ${usuario.email}', // Usar la propiedad correcta: email
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 4),
            Text(
              'Tree: ${usuario.tree}', // Usar la propiedad correcta: tree
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
