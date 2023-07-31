import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/users/presentations/block/login_bloc.dart';
import '/users/presentations/pages/recoveryPass.dart';
import '../../../alertas/presentations/pages/HomePage.dart';
import '../../../chat/presentations/block/chat.bloc.dart';
import '../../../chat/presentations/pages/chat.dart';
import 'RegistrationScreen.dart';
import '/users/presentations/block/login_state.dart';
import '/users/presentations/block/login_event.dart';
class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: Scaffold(
        body: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            if (state is LoginLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is LoginError) {
              return Center(
                child: Text(state.errorMessage),
              );
            } else if (state is LoginSuccess) {
              return MyHomePage();
            } else {
              return _buildLoginForm(context, state);
            }
          },
        ),
      ),
    );
  }

  Widget _buildLoginForm(BuildContext context, LoginState state) {
    final loginBloc = BlocProvider.of<LoginBloc>(context);

    return Stack(
      children: [
        Positioned.fill(
          child: Transform.scale(
            scale: 1.2,
            child: Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                'assets/images/Rectangl.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(top: 0.01),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                        bottom: 5.0,
                      ),
                      child: Icon(
                        Icons.security,
                        size: 50.0,
                        color: Color.fromARGB(255, 253, 253, 254),
                      ),
                    ),
                    Text(
                      'Colonia',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'segura',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              TextField(
                controller: loginBloc.emailController,
                keyboardType: TextInputType.emailAddress,
                onChanged: (email) {
                  loginBloc.add(EmailChanged(email));
                },
                decoration: InputDecoration(
                  labelText: 'Email',
                  errorText: (state is LoginError && !state.isEmailValid)
                      ? 'Invalid email'
                      : null,
                  prefixIcon: Icon(Icons.email),
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              TextField(
                controller: loginBloc.passwordController,
                obscureText: true,
                onChanged: (password) {
                  loginBloc.add(PasswordChanged(password));
                },
                decoration: InputDecoration(
                  labelText: 'Password',
                  errorText: (state is LoginError && !state.isPasswordValid)
                      ? 'Invalid password'
                      : null,
                  prefixIcon: Icon(Icons.lock),
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              FractionallySizedBox(
                widthFactor: 0.8,
                child: ElevatedButton(
                  onPressed: () {
                    loginBloc.add(LoginButtonPressed());
                  },
                  child: Text('Log In'),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => recoveryPass(),
                    ),
                  );
                },
                child: Text('¿Olvidaste tu contraseña?'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => RegistrationScreen(),
                    ),
                  );
                },
                child: Text('Registrarse'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
