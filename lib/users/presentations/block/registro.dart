import 'package:flutter/material.dart';

class RegistrationBloc {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController gmailController = TextEditingController();

  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    gmailController.dispose();
  }

  bool _isValidGmail(String email) {
    final RegExp gmailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@gmail.com$');
    return gmailRegex.hasMatch(email);
  }

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name.';
    }
    return null;
  }

  String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your phone number.';
    } else if (value.length != 10) {
      return 'Phone number must be 10 digits.';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password.';
    } else if (value.length < 8) {
      return 'Password must be at least 8 characters long.';
    }
    return null;
  }

  String? validateGmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your Gmail address.';
    } else if (!_isValidGmail(value)) {
      return 'Invalid Gmail address.';
    }
    return null;
  }

  bool isFormValid() {
    return true; 
  }
}
