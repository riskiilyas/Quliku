import 'package:flutter/material.dart';
import 'package:quliku/util/constants.dart';
import 'package:quliku/widget/custom_removable_mandor_item.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<WishListScreen> {
  List<int> indices = [0, 1, 2, 3, 4, 5];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Constants.COLOR_MAIN, //change your color here
        ),
        backgroundColor: Colors.white,
        centerTitle: false,
        title: const Text(
          "Mandor Favorit",
          style: TextStyle(
              color: Constants.COLOR_TITLE, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Expanded(
              child: RefreshIndicator(
                color: Constants.COLOR_MAIN,
                onRefresh: () {
                  return Future.delayed(
                    Duration(seconds: 2),
                        () {
                    },
                  );
                },
                child: ListView.builder(
                    itemCount: indices.length,
                    itemBuilder: (BuildContext context, int index) {
                      return RemovableMandorItem(
                        fullname:
                            "Muhammad Faris Akbar lailatul qadrin azhari ${indices[index]}",
                        rating: 4.5,
                        experience: 12,
                        rangeKuli: "40 - 70 kuli",
                        location: "Sidoarjo",
                        imgUrl: "assets/dummy-profile.png",
                        onPressed: () => {},
                        onRemoved: () {
                          Constants.showMyDialog(context, "Ingin Hapus dari mandor favorit?",
                              (result) {
                            if (result) {
                              setState(() {
                                indices.removeAt(index);
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Mandor Dihapus')));
                            }
                          });
                        },
                      );
                    }),
              )),
        ),
      ),
    );
  }
}
