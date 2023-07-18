import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quliku/util/constants.dart';
import 'package:quliku/notifier/detail_mandor_notifier.dart';

class MandorItem extends StatelessWidget {
  final String fullname;
  final int rating;
  final String experience;
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
              Expanded(
                flex: 1,
                child: Center(
                  child: SizedBox(
                    width: 64,
                    child: Image.network(
                      imgUrl,
                      fit: BoxFit.fitWidth,
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        }
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                                : null,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Expanded(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      fullname,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          color: Constants.COLOR_TEXT,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Constants.COLOR_MAIN,
                          size: 14,
                        ),
                        Text(
                          "$rating | ",
                          style: const TextStyle(
                            color: Constants.COLOR_TEXT,
                          ),
                        ),
                        const Icon(
                          Icons.bar_chart,
                          color: Constants.COLOR_TEXT,
                          size: 14,
                        ),
                        Text(
                          "$experience Tahun | ",
                          style: const TextStyle(
                            color: Constants.COLOR_TEXT,
                          ),
                        ),
                        const Icon(
                          Icons.groups,
                          color: Constants.COLOR_TEXT,
                          size: 14,
                        ),
                        Text(
                          " $rangeKuli",
                          style: const TextStyle(
                            color: Constants.COLOR_TEXT,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.pin_drop,
                          color: Constants.COLOR_TEXT,
                          size: 14,
                        ),
                        Text(
                          location,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Constants.COLOR_TEXT,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
