import 'package:flutter/material.dart';
import 'package:quliku/util/Constants.dart';

class KlasifikasiButton extends StatelessWidget {
  final String text;
  final String imgUrl;
  final Function() onPressed;

  const KlasifikasiButton(
      {Key? key,
        required this.text,
        required this.imgUrl,
        required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              width: 56,
              child: Image.asset(
                imgUrl,
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(height: 4,),
          Text(
            text,
            style: const TextStyle(
                color: Constants.COLOR_TEXT,
                fontWeight: FontWeight.bold,
                fontSize: 12
            ),
          )
        ],
      ),
    );
  }
}
