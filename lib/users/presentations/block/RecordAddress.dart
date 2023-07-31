import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class RecordAddressBloc extends Cubit<void> {
  RecordAddressBloc() : super(null);

  final TextEditingController addressController = TextEditingController();
  final TextEditingController postalCodeController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController municipalityController = TextEditingController();
  final TextEditingController streetController = TextEditingController();
  final TextEditingController interiorNumberController = TextEditingController();

  final ValueNotifier<bool> isAddressValid = ValueNotifier(true);
  final ValueNotifier<bool> isPostalCodeValid = ValueNotifier(true);
  final ValueNotifier<bool> isStateValid = ValueNotifier(true);
  final ValueNotifier<bool> isMunicipalityValid = ValueNotifier(true);
  final ValueNotifier<bool> isStreetValid = ValueNotifier(true);
  final ValueNotifier<bool> isInteriorNumberValid = ValueNotifier(true);

  void validateInputs() {
    isAddressValid.value = addressController.text.isNotEmpty;
    isPostalCodeValid.value = postalCodeController.text.isNotEmpty;
    isStateValid.value = stateController.text.isNotEmpty;
    isMunicipalityValid.value = municipalityController.text.isNotEmpty;
    isStreetValid.value = streetController.text.isNotEmpty;
    isInteriorNumberValid.value = interiorNumberController.text.isNotEmpty;
  }

  bool get isFormValid => isAddressValid.value && isPostalCodeValid.value && isStateValid.value && isMunicipalityValid.value && isStreetValid.value && isInteriorNumberValid.value;

  // Clean up
  void dispose() {
    addressController.dispose();
    postalCodeController.dispose();
    stateController.dispose();
    municipalityController.dispose();
    streetController.dispose();
    interiorNumberController.dispose();
    isAddressValid.dispose();
    isPostalCodeValid.dispose();
    isStateValid.dispose();
    isMunicipalityValid.dispose();
    isStreetValid.dispose();
    isInteriorNumberValid.dispose();
  }
}
