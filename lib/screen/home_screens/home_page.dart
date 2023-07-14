import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quliku/screen/cari_mandor_screen.dart';
import 'package:quliku/widget/custom_mandor_item.dart';

import '../../util/constants.dart';
import '../../widget/custom_klasifikasi_button.dart';

class HomePage extends StatelessWidget {
  final Function() onCariMandor;
  const HomePage({Key? key, required this.onCariMandor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
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
            child: ListView(
              children: [
                const SizedBox(
                  height: 24,
                ),
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
                  onTap: (){
                    onCariMandor();
                    },
                  child: Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(24)),
                        border: Border.all(width: 4, color: Constants.COLOR_MAIN),
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
                const SizedBox(
                  height: 8,
                ),
                Column(
                  children: List.generate(
                      5,
                      (index) => MandorItem(
                            fullname:
                                "Muhammad Faris Akbar lailatul qadrin azhari $index",
                            rating: 4.5,
                            experience: 12,
                            rangeKuli: "40 - 70 kuli",
                            location: "Sidoarjo",
                            imgUrl: "assets/dummy-profile.png",
                            onPressed: () => {},
                          )),
                ),
                const SizedBox(
                  height: 24,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
