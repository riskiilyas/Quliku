import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:quliku/bloc/bloc_reccomend_mandor.dart';

class Constants {
  static const COLOR_MAIN = Color(0xFFF88214);
  static const COLOR_HINT_TEXT = Color(0xFFC2C2C2);
  static const COLOR_TITLE = Color(0xFF505050);
  static const COLOR_TEXT = Color(0xFF707070);

  static void goto(BuildContext context, Widget page) {
    Get.to(MultiBlocProvider(providers: [
          BlocProvider.value(
              value: BlocProvider.of<ReccomendMandorBloc>(context)),
        ], child: page));
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
}
