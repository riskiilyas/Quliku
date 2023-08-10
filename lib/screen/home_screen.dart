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
  void initState() {
    super.initState();
    print('newwwww');
    pages.add(HomePage(
      onCariMandor: () => Get.to(() => const CariMandorScreen()),
    ));
    pages.add(const ProfilPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Constants.COLOR_MAIN, //change your color here
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        centerTitle: false,
        title: Image.asset("assets/logo_appbar.png", fit: BoxFit.contain,height: 36,),
        actions: <Widget>[
          // IconButton(
          //     icon: const Icon(Icons.favorite),
          //     onPressed: () {
          //       Get.to(() => const WishListScreen());
          //     }),
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
        child: const Icon(Icons.search, color: Colors.white,),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              iconSize: 30,
                onPressed: () => {
                      setState(() => {_index = 0})
                    },
                icon: SizedBox(
                  height: double.infinity,
                  child: Icon(
                    Icons.home,
                    color: _index == 0 ? Constants.COLOR_MAIN : Colors.grey[700],
                  ),
                )),
            IconButton(
                onPressed: () => {
                      setState(() => {_index = 1})
                    },
                icon: Icon(
                  Icons.account_circle,
                  size: 30,
                  color: _index == 1 ? Constants.COLOR_MAIN : Colors.grey[700],
                )),
          ],
        ),
      ),
    );
  }
}
