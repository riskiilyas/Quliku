import 'package:flutter/material.dart';
import 'package:quliku/util/constants.dart';

class KlasifikasiButton extends StatelessWidget {
  final String text;
  final String imgUrl;
  final Function() onPressed;
  final double size;
  final double space;

  const KlasifikasiButton(
      {Key? key,
        this.size = 56,
        this.space = 8,
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
              width: size,
              height: size,
              child: Image.asset(
                imgUrl,
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(
            height: space,
          ),
          Text(
            text,
            style: const TextStyle(
                color: Constants.COLOR_TEXT,
                fontWeight: FontWeight.bold,
                fontSize: 12),
          )
        ],
      ),
    );
  }
}
