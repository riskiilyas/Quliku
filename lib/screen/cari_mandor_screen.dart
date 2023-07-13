import 'package:flutter/material.dart';
import 'package:quliku/util/constants.dart';
import 'package:quliku/widget/custom_removable_mandor_item.dart';
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
          "Mandor Favorit",
          style: TextStyle(
              color: Constants.COLOR_TITLE, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Expanded(
              child: Column(
            children: [
              CustomSearchBar(hint: "Cari Mandir...", callback: (keyword) {}),
              SizedBox(height: 16,),
              Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(4)),
                          border: Border.all(width: 1, color: Constants.COLOR_HINT_TEXT),
                        ),
                        child: Center(
                          child: DropdownButton(
                              icon: Icon(Icons.construction),
                              value: "USA",
                              items: dropdownItems, onChanged: (_) {}),
                        ),
                      )),
                  SizedBox(width: 16,),
                  Expanded(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(4)),
                          border: Border.all(width: 1, color: Constants.COLOR_HINT_TEXT),
                        ),
                        child: Center(
                          child: DropdownButton(
                            icon: Icon(Icons.pin_drop),
                            value: "USA",
                              items: dropdownItems, onChanged: (_) {}),
                        ),
                      )),
                ],
              )
            ],
          )),
        ),
      ),
    );
  }

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("USA"), value: "USA"),
      DropdownMenuItem(child: Text("Canada"), value: "Canada"),
      DropdownMenuItem(child: Text("Brazil"), value: "Brazil"),
      DropdownMenuItem(child: Text("England"), value: "England"),
    ];
    return menuItems;
  }
}
