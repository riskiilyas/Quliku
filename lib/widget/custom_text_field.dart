import 'package:flutter/material.dart';

import '../util/Constants.dart';

class CustomTextField extends StatefulWidget {
  final String hint;
  final IconData icon;

  const CustomTextField({Key? key, required this.hint, required this.icon})
      : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  String _text = "";
  bool isHide = true;

  String getText() => _text;

  bool isEmpty() => _text.isEmpty;

  @override
  Widget build(BuildContext context) {
    return TextField(
        obscureText: widget.icon == Icons.password && isHide ? true : false,
        onChanged: (text) => {_text = text},
        decoration: InputDecoration(
            hintText: widget.hint,
            hintStyle: const TextStyle(color: Constants.COLOR_HINT_TEXT),
            prefixIcon: Icon(widget.icon),
            suffixIcon: widget.icon == Icons.password
                ? IconButton(
                    onPressed: () => {
                          setState(() {
                            isHide = !isHide;
                          })
                        },
                    icon: isHide
                        ? const Icon(Icons.visibility_off)
                        : const Icon(Icons.visibility))
                : null,
            border: const OutlineInputBorder(
                borderSide: BorderSide(color: Constants.COLOR_MAIN))));
  }
}
