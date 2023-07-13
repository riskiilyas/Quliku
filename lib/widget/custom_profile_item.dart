import 'package:flutter/material.dart';
import 'package:quliku/util/constants.dart';

class ProfileItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function() onPressed;

  const ProfileItem(
      {Key? key,
      required this.title,
      required this.icon,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            border: Border.all(color: Constants.COLOR_MAIN),
          ),
          child: Row(
            children: [
              Expanded(
                flex: 5,
                child: Row(
                  children: [
                    Icon(
                      icon,
                      color: Constants.COLOR_MAIN,
                      size: 32,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      title,
                      style: const TextStyle(
                          color: Constants.COLOR_TITLE,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const Expanded(
                  flex: 1,
                  child: Icon(
                    Icons.chevron_right,
                    color: Constants.COLOR_MAIN,
                  ))
            ],
          )),
    );
  }
}
