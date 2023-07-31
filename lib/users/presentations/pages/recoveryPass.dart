import 'package:flutter/material.dart';

import 'login.dart';

class recoveryPass extends StatefulWidget {
  @override
  _recoveryPass createState() => _recoveryPass();
}

class _recoveryPass extends State<recoveryPass> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController postalCodeController = TextEditingController();

  bool isEmailValid = true;
  bool isAddressValid = true;
  bool isPostalCodeValid = true;

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
                    'asset/images/Rectangl.png',
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
                            color: Color.fromARGB(255, 0, 0, 0),
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
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Correo electrónico',
                      errorText: isEmailValid ? null : 'Invalid email',
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
                  
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isEmailValid = emailController.text.isNotEmpty;
                        isAddressValid = addressController.text.isNotEmpty;
                        isPostalCodeValid = postalCodeController.text.isNotEmpty;

                        if (isEmailValid && isAddressValid && isPostalCodeValid) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Registro exitoso'),
                                content: Text('¡Enhorabuena! Te has registrado correctamente.'),
                                actions: [
                                  TextButton(
                                    child: Text('Cerrar'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                      Navigator.pop(context); // Go back to the login screen
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      });
                    },
                    child: Text('enviar'),
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
          ],
        ),
      ),
    );
  }
}
