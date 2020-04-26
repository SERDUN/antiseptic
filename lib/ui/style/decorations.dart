import 'package:flutter/material.dart';

class CustomDecoration {
  static InputDecoration getDefaultInputDecoration({String hint}) {
    return InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue, width: 1.0),
        ),
        hintText: hint,
        hintStyle: TextStyle(color: Colors.blue.withOpacity(0.5)));
  }
}
