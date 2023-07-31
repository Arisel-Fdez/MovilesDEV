import 'package:equatable/equatable.dart';
import 'usuario.dart';

abstract class UsuarioState extends Equatable {
  const UsuarioState();

  @override
  List<Object?> get props => [];
}

class UsuarioInitial extends UsuarioState {}

class UsuarioLoading extends UsuarioState {}

class UsuarioLoaded extends UsuarioState {
  final List<Usuario> usuarios;

  UsuarioLoaded(this.usuarios);

  @override
  List<Object?> get props => [usuarios];
}

class UsuarioError extends UsuarioState {}
