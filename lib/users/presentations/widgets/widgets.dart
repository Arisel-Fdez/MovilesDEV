import 'package:flutter/material.dart';

class SecurityIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String? Function(String?) validator;
  final bool obscureText;
  final TextInputType keyboardType;
  final int? maxLength;

  const CustomTextField({
    required this.controller,
    required this.labelText,
    required this.validator,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.maxLength,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: obscureText,
      keyboardType: keyboardType,
      maxLength: maxLength,
      decoration: InputDecoration(
        labelText: labelText,
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
      ),
    );
  }
}
