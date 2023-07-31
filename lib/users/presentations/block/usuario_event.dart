import 'package:equatable/equatable.dart';

abstract class UsuarioEvent extends Equatable {
  const UsuarioEvent();

  @override
  List<Object?> get props => [];
}

class ObtenerUsuarios extends UsuarioEvent {
  final String orden;

  ObtenerUsuarios(this.orden);

  @override
  List<Object?> get props => [orden];
}
