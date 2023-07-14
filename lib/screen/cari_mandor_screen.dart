import 'package:flutter/material.dart';
import 'package:quliku/util/constants.dart';
import 'package:quliku/widget/custom_mandor_item.dart';
import 'package:quliku/widget/custom_search_bar.dart';

class CariMandorScreen extends StatefulWidget {
  const CariMandorScreen({super.key});

  @override
  State<CariMandorScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<CariMandorScreen> {
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
          "Cari Mandor",
          style: TextStyle(
              color: Constants.COLOR_TITLE, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
          children: [
              Flexible(
                flex: 1,
                child: Column(
                  children: [
                    Flexible(flex: 3,child: CustomSearchBar(hint: "Cari Mandor...", callback: (keyword) {})),
                    const Flexible(
                      flex: 1,
                      child: Divider(),
                    ),
                    Flexible(
                      flex: 3,
                      child: Row(
                        children: [
                          Flexible(
                              flex: 1,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius:
                                      const BorderRadius.all(Radius.circular(4)),
                                  border: Border.all(
                                      width: 1, color: Constants.COLOR_HINT_TEXT),
                                ),
                                child: Center(
                                  child: DropdownButton(
                                      icon: const Icon(Icons.construction),
                                      value: "Infrastruktur",
                                      items: dropdownKlasifikasi,
                                      onChanged: (_) {}),
                                ),
                              )),
                          const SizedBox(
                            width: 16,
                          ),
                          Flexible(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius:
                                      const BorderRadius.all(Radius.circular(4)),
                                  border: Border.all(
                                      width: 1, color: Constants.COLOR_HINT_TEXT),
                                ),
                                child: Center(
                                  child: DropdownButton(
                                      icon: const Icon(Icons.pin_drop),
                                      value: "Surabaya",
                                      items: dropdownLokasi,
                                      onChanged: (_) {}),
                                ),
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 4,
                child: ListView(
                  children: List.generate(
                      10,
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
              ),
          ],
        ),
            )),
      ),
    );
  }

  List<DropdownMenuItem<String>> get dropdownKlasifikasi {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(
          value: "Infrastruktur", child: Text("Infrastruktur")),
      const DropdownMenuItem(
          value: "Sumber Daya Air", child: Text("Sumber Daya Air")),
      const DropdownMenuItem(value: "Cipta Karya", child: Text("Cipta Karya")),
    ];
    return menuItems;
  }
}

List<DropdownMenuItem<String>> get dropdownLokasi {
  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(value: "Surabaya", child: Text("Surabaya")),
    const DropdownMenuItem(value: "Sidoarjo", child: Text("Sidoarjo")),
    const DropdownMenuItem(value: "Malang", child: Text("Malang")),
    const DropdownMenuItem(value: "Gresik", child: Text("Gresik")),
    const DropdownMenuItem(value: "Mojokerto", child: Text("Mojokerto")),
  ];
  return menuItems;
}
