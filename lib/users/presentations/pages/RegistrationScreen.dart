import 'package:flutter/material.dart';
import 'RecordAddress.dart';
import 'login.dart';
import '../block/registro.dart';
import '/users/presentations/widgets/widgets.dart';


class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final RegistrationBloc _bloc = RegistrationBloc();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
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
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SecurityIcon(), // Use the SecurityIcon widget here
                    SizedBox(height: 20.0),
                    CustomTextField(
                      controller: _bloc.nameController,
                      labelText: 'Name',
                      validator: _bloc.validateName,
                    ),
                    SizedBox(height: 10.0),
                    CustomTextField(
                      controller: _bloc.gmailController,
                      labelText: 'Email',
                      validator: _bloc.validateGmail,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 10.0),
                    CustomTextField(
                      controller: _bloc.passwordController,
                      labelText: 'Password',
                      validator: _bloc.validatePassword,
                      obscureText: true,
                    ),
                    SizedBox(height: 10.0),
                    CustomTextField(
                      controller: _bloc.phoneController,
                      labelText: 'Phone',
                      validator: _bloc.validatePhone,
                      keyboardType: TextInputType.phone,
                      maxLength: 10,
                    ),
                    SizedBox(height: 20.0),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState != null && _formKey.currentState!.validate()) {
                          // All fields are valid, proceed to the next screen
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => RecordAddress()),
                          );
                        }
                      },
                      child: Text('Siguiente'),
                    ),
                    SizedBox(height: 10.0),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => LoginScreen(),
                          ),
                        );
                      },
                      child: Text('Log In'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
