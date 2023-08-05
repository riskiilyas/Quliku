import 'dart:io';

import 'package:flutter/material.dart';

class Constants {
  static const COLOR_MAIN = Color(0xFFF98214);
  static const COLOR_MAIN_TEXT = Color(0xFFF05829);
  static const COLOR_HINT_TEXT = Color(0xFFC2C2C2);
  static const COLOR_TITLE = Color(0xFF505050);
  static const COLOR_TEXT = Color(0xFF707070);

  static const PREF_UID = "uid";
  static const PREF_NAME = "name";
  static const PREF_USERNAME = "username";
  static const PREF_EMAIL = "email";
  static const PREF_PASSWORD = "password";
  static const PREF_ROLE = "role";
  static const PREF_PROFILE_URL = "profile_url";
  static const PREF_TOKEN = "token";

  static void goto(BuildContext context, Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  static void popto(BuildContext context, Widget page) {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => page));
  }

  static void showSnackbar(BuildContext context, String msg) {
    var snackBar = SnackBar(content: Text(msg));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static Future<void> showMyDialog(
      BuildContext context, String message, Function(bool) callback) async {
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
              child: const Text(
                'Tidak',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: COLOR_MAIN),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                callback(false);
              },
            ),
            TextButton(
              child: const Text(
                'Iya',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: COLOR_MAIN),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                callback(true);
              },
            ),
          ],
        );
      },
    );
  }

  static Future<void> showImage(BuildContext context, File img) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Center(
          child: Stack(children: [
            Image.file(img),
            Positioned(
              top: 0,
              right: 0,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200.withOpacity(0.8)),
                  child: const Icon(
                    Icons.cancel_outlined,
                    size: 32,
                    color: Constants.COLOR_MAIN_TEXT,
                  ),
                ),
              ),
            ),
          ]),
        );
      },
    );
  }
}
