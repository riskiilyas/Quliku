import 'dart:ui';

import 'package:flutter/material.dart';

class Constants {
  static const COLOR_MAIN = Color(0xFFF88214);
  static const COLOR_HINT_TEXT = Color(0xFFC2C2C2);
  static const COLOR_TITLE = Color(0xFF505050);
  static const COLOR_TEXT = Color(0xFF707070);


  static Future<void> showMyDialog(BuildContext context, String message, Function(bool) callback) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Informasi'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(message),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Iya'),
              onPressed: () {
                Navigator.of(context).pop();
                callback(true);
              },
            ),
            TextButton(
              child: const Text('Tidak'),
              onPressed: () {
                Navigator.of(context).pop();
                callback(false);
              },
            ),
          ],
        );
      },
    );
  }
}