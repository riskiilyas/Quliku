import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:quliku/util/Constants.dart';
import 'package:quliku/widget/custom_klasifikasi_button.dart';
import 'package:quliku/widget/custom_mandor_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomeScreen> {
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
        title: const Text(
          "Quliku",
          style: TextStyle(
              color: Constants.COLOR_TITLE, fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          IconButton(icon: const Icon(Icons.favorite), onPressed: () {}),
          IconButton(icon: const Icon(Icons.location_city), onPressed: () {}),
        ],
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    const SizedBox(height: 24,),
                    const Text(
                      "Halo, riskiilyas@gmail.com",
                      style: TextStyle(
                          color: Constants.COLOR_TITLE,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      "cari mandor yang sesuai dengan kebutuhan anda",
                      style: TextStyle(
                        color: Constants.COLOR_TEXT,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    InkWell(
                      onTap: () => {},
                      child: Container(
                          padding: const EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(24)),
                            border: Border.all(
                                width: 4, color: Constants.COLOR_MAIN),
                          ),
                          child: Row(
                            children: const [
                              Icon(
                                Icons.search,
                                color: Constants.COLOR_MAIN,
                              ),
                              Text(
                                "Cari Mandor",
                                style: TextStyle(
                                    color: Constants.COLOR_TITLE,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          )),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const Text(
                      "Klasifikasi Mandor",
                      style: TextStyle(
                          color: Constants.COLOR_TITLE,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    const Text(
                      "pilih mandor yang sesuai dengan kebutuhan anda",
                      style: TextStyle(
                        color: Constants.COLOR_TEXT,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Card(
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            KlasifikasiButton(
                                text: "Sumber Daya Air",
                                imgUrl: "assets/homepage_air.png",
                                onPressed: () => {}),
                            KlasifikasiButton(
                                text: "Infrastruktur",
                                imgUrl: "assets/homepage_infra.png",
                                onPressed: () => {}),
                            KlasifikasiButton(
                                text: "Pencipta Karyaan",
                                imgUrl: "assets/homepage_karya.png",
                                onPressed: () => {})
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const Text(
                      "Rekomendasi Mandor",
                      style: TextStyle(
                          color: Constants.COLOR_TITLE,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    const Text(
                      "Pilihan mandor terbaik yang dapat anda pilih",
                      style: TextStyle(
                        color: Constants.COLOR_TEXT,
                      ),
                    ),
                    MandorItem(
                        fullname: "Muhammad Faris Akbar",
                        rating: 4.5,
                        experience: 12,
                        rangeKuli: "40 - 70 kuli",
                        location: "Sidoarjo",
                        imgUrl: "assets/dummy-profile.png",
                        onPressed: () => {}),
                    MandorItem(
                        fullname: "Muhammad Faris Akbar",
                        rating: 4.5,
                        experience: 12,
                        rangeKuli: "40 - 70 kuli",
                        location: "Sidoarjo",
                        imgUrl: "assets/dummy-profile.png",
                        onPressed: () => {}),
                    MandorItem(
                        fullname: "Muhammad Faris Akbar",
                        rating: 4.5,
                        experience: 12,
                        rangeKuli: "40 - 70 kuli",
                        location: "Sidoarjo",
                        imgUrl: "assets/dummy-profile.png",
                        onPressed: () => {}),
                    MandorItem(
                        fullname: "Muhammad Faris Akbar",
                        rating: 4.5,
                        experience: 12,
                        rangeKuli: "40 - 70 kuli",
                        location: "Sidoarjo",
                        imgUrl: "assets/dummy-profile.png",
                        onPressed: () => {}),
                    const SizedBox(height: 24,),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Constants.COLOR_MAIN,
        items: const <Widget>[
          Icon(Icons.home, size: 30),
          Icon(Icons.search, size: 30),
          Icon(Icons.person, size: 30),
        ],
        onTap: (index) {
          //Handle button tap
        },
      ),
    );
  }
}
