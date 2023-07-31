import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login.dart';
import '/users/presentations/block/RecordAddress.dart';
import '/users/presentations/widgets/widgets.dart';

class RecordAddress extends StatelessWidget {
  RecordAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RecordAddressBloc>(
      create: (context) => RecordAddressBloc(),
      child: _RecordAddressForm(),
    );
  }
}class _RecordAddressForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final RecordAddressBloc recordAddressBloc =
        BlocProvider.of<RecordAddressBloc>(context);

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
                    SecurityIcon(),
                    SizedBox(height: 20.0),
                    CustomTextField(
                      controller: recordAddressBloc.addressController,
                      labelText: 'Dirección',
                      validator: (value) =>
                          recordAddressBloc.isAddressValid.value
                              ? null
                              : 'Dirección inválida',
                    ),
                    SizedBox(height: 10.0),
                    CustomTextField(
                      controller: recordAddressBloc.postalCodeController,
                      labelText: 'Código Postal',
                      validator: (value) =>
                          recordAddressBloc.isPostalCodeValid.value
                              ? null
                              : 'Código postal inválido',
                    ),
                    SizedBox(height: 10.0),
                    CustomTextField(
                      controller: recordAddressBloc.stateController,
                      labelText: 'Estado',
                      validator: (value) =>
                          recordAddressBloc.isStateValid.value
                              ? null
                              : 'Estado inválido',
                    ),
                    SizedBox(height: 10.0),
                    CustomTextField(
                      controller: recordAddressBloc.municipalityController,
                      labelText: 'Municipio',
                      validator: (value) =>
                          recordAddressBloc.isMunicipalityValid.value
                              ? null
                              : 'Municipio inválido',
                    ),
                    SizedBox(height: 10.0),
                    CustomTextField(
                      controller: recordAddressBloc.streetController,
                      labelText: 'Calle',
                      validator: (value) =>
                          recordAddressBloc.isStreetValid.value
                              ? null
                              : 'Calle inválida',
                    ),
                    SizedBox(height: 10.0),
                    CustomTextField(
                      controller: recordAddressBloc.interiorNumberController,
                      labelText: 'Número Interior',
                      validator: (value) =>
                          recordAddressBloc.isInteriorNumberValid.value
                              ? null
                              : 'Número interior inválido',
                    ),
                    ElevatedButton(
                      onPressed: () {
                        recordAddressBloc.validateInputs();
                        if (_formKey.currentState!.validate() &&
                            recordAddressBloc.isFormValid) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Registro exitoso'),
                                content: Text(
                                    '¡Enhorabuena! Te has registrado correctamente.'),
                                actions: [
                                  TextButton(
                                    child: Text('Cerrar'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      },
                      child: Text('Registrar'),
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
                      child: Text('Iniciar Sesión'),
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
