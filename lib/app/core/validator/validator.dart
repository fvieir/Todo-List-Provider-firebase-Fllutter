import 'package:flutter/material.dart';

class Validator {
  Validator._();

  static FormFieldValidator compare(
      TextEditingController valueEC, String message) {
    return (value) {
      if (valueEC.text.isEmpty || valueEC.text != value) {
        return message;
      }
      return null;
    };
  }
}
