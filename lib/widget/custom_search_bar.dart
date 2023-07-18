import 'package:flutter/material.dart';

import '../util/constants.dart';

class CustomSearchBar extends StatefulWidget {
  final String hint;
  final Function(String) callback;

  const CustomSearchBar({Key? key, required this.hint, required this.callback})
      : super(key: key);

  @override
  State<CustomSearchBar> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomSearchBar> {
  TextEditingController controller = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: widget.callback,
      decoration: InputDecoration(
          hintText: widget.hint,
          hintStyle: const TextStyle(color: Constants.COLOR_HINT_TEXT),
          prefixIcon: const Icon(Icons.search),
          suffixIcon: IconButton(
              onPressed: () => {
                    setState(() {
                      controller.text = "";
                    })
                  },
              icon: const Icon(Icons.cancel_outlined)),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(24)),
              borderSide: BorderSide(color: Constants.COLOR_MAIN, width: 4))),
    );
  }
}
