import 'package:flutter/material.dart';

import '../util/Constants.dart';

class CustomTextField extends StatelessWidget {
  String _text = "";
  final String hint;
  final IconData icon;

  CustomTextField({Key? key, required this.hint, required this.icon}) : super(key: key);

  String getText() => _text;

  bool isEmpty() => _text.isEmpty;

  @override
  Widget build(BuildContext context) {
    return TextField(
        onChanged: (text) => {_text = text},
        decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Constants.COLOR_HINT_TEXT),
            prefixIcon: Icon(icon),
            border: const OutlineInputBorder(borderSide: BorderSide(color: Constants.COLOR_MAIN))));
  }
}
