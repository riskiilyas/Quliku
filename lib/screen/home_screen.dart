import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quliku/screen/cari_mandor_screen.dart';
import 'package:quliku/screen/home_screens/home_page.dart';
import 'package:quliku/screen/home_screens/profil_page.dart';
import 'package:quliku/screen/wishlist_screen.dart';
import 'package:quliku/util/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});


  @override
  State<HomeScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomeScreen> {
  int _index = 0;
  List<Widget> pages = [];

  @override
  Widget build(BuildContext context) {
    pages.add(HomePage(
      onCariMandor: () => Get.to(() => const CariMandorScreen()),
      blocContext: context,
    ));
    pages.add(const ProfilPage());
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Constants.COLOR_MAIN, //change your color here
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        centerTitle: false,
        title: Text(
          _index == 0 ? "Quliku" : "Profil Saya",
          style: const TextStyle(
              color: Constants.COLOR_TITLE, fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.favorite),
              onPressed: () {
                Get.to(() => WishListScreen());
              }),
          IconButton(icon: const Icon(Icons.location_city), onPressed: () {}),
        ],
      ),
      body: pages[_index],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        backgroundColor: Constants.COLOR_MAIN,
        elevation: 2.0,
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
                onPressed: () => {
                      setState(() => {_index = 0})
                    },
                icon: Icon(
                  Icons.home,
                  size: 30,
                  color: _index == 0 ? Constants.COLOR_MAIN : Colors.black,
                )),
            IconButton(
                onPressed: () => {
                      setState(() => {_index = 1})
                    },
                icon: Icon(
                  Icons.person,
                  size: 30,
                  color: _index == 1 ? Constants.COLOR_MAIN : Colors.black,
                )),
          ],
        ),
      ),
    );
  }
}
