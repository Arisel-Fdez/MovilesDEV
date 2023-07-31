abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final String token; // Cambiar a String
  LoginSuccess(this.token); // Almacenar el token
}

class LoginError extends LoginState {
  final bool isEmailValid;
  final bool isPasswordValid;
  final String errorMessage;

  LoginError(this.errorMessage,
      {this.isEmailValid = true, this.isPasswordValid = true});
}
