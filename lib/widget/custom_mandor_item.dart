import 'package:flutter/material.dart';
import 'package:quliku/util/Constants.dart';

class MandorItem extends StatelessWidget {
  final String fullname;
  final double rating;
  final int experience;
  final String rangeKuli;
  final String location;
  final String imgUrl;
  final Function() onPressed;

  const MandorItem(
      {Key? key,
        required this.fullname,
        required this.rating,
        required this.experience,
        required this.rangeKuli,
        required this.location,
        required this.imgUrl,
        required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Center(
                child: SizedBox(
                  width: 64,
                  child: Image.asset(
                    imgUrl,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(width: 12,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    fullname,
                    style: const TextStyle(
                      color: Constants.COLOR_TEXT,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  const SizedBox(height: 4,),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Constants.COLOR_MAIN,),
                      Text(
                        "$rating | ",
                        style: const TextStyle(
                          color: Constants.COLOR_TEXT,
                        ),
                      ),
                      const Icon(Icons.bar_chart, color: Constants.COLOR_TEXT,),
                      Text(
                        "$experience Tahun | ",
                        style: const TextStyle(
                          color: Constants.COLOR_TEXT,
                        ),
                      ),
                      const Icon(Icons.groups, color: Constants.COLOR_TEXT,),
                      Text(
                        " $rangeKuli",
                        style: const TextStyle(
                          color: Constants.COLOR_TEXT,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4,),
                  Row(
                    children: [
                      const Icon(Icons.pin_drop, color: Constants.COLOR_TEXT,),
                      Text(
                        location,
                        style: const TextStyle(
                          color: Constants.COLOR_TEXT,
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
