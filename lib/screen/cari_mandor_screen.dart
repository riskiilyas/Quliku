import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quliku/util/constants.dart';
import 'package:quliku/widget/custom_mandor_item.dart';
import 'package:quliku/widget/custom_search_bar.dart';
import 'package:quliku/notifier/search_mandor_notifier.dart';

class CariMandorScreen extends StatefulWidget {
  const CariMandorScreen({super.key});

  @override
  State<CariMandorScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<CariMandorScreen> {
  @override
  Widget build(BuildContext context) {
    context.watch<SearchMandorNotifier>();
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
                    Flexible(
                        flex: 3,
                        child: CustomSearchBar(
                            hint: "Cari Mandor...",
                            callback: (keyword) {
                              String classification = context
                                  .read<SearchMandorNotifier>()
                                  .classification;
                              String city =
                                  context.read<SearchMandorNotifier>().city;
                              context
                                  .read<SearchMandorNotifier>()
                                  .fetch(keyword, classification, city);
                            })),
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
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(4)),
                                  border: Border.all(
                                      width: 1,
                                      color: Constants.COLOR_HINT_TEXT),
                                ),
                                child: Center(
                                  child: DropdownButton(
                                      icon: const Icon(Icons.construction),
                                      value: context
                                          .read<SearchMandorNotifier>()
                                          .classification,
                                      items: dropdownKlasifikasi,
                                      onChanged: (_) {
                                        if (_ != null) {
                                          context
                                              .read<SearchMandorNotifier>()
                                              .classification = _;
                                        }
                                      }),
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
                                  value:
                                      context.read<SearchMandorNotifier>().city,
                                  items: dropdownLokasi,
                                  onChanged: (_) {
                                    if (_ != null) {
                                      context
                                          .read<SearchMandorNotifier>()
                                          .city = _;
                                    }
                                  }),
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
                      context.read<SearchMandorNotifier>().data.length,
                      (index) => MandorItem(
                            fullname: context
                                .read<SearchMandorNotifier>()
                                .data[index]
                                .name,
                            rating: context
                                .read<SearchMandorNotifier>()
                                .data[index]
                                .rating,
                            experience: context
                                .read<SearchMandorNotifier>()
                                .data[index]
                                .details
                                .experience,
                            rangeKuli:
                                "${context.read<SearchMandorNotifier>().data[index].details.minPeople} - ${context.read<SearchMandorNotifier>().data[index].details.maxPeople} kuli",
                            location: context
                                .read<SearchMandorNotifier>()
                                .data[index]
                                .details
                                .city,
                            imgUrl: context
                                .read<SearchMandorNotifier>()
                                .data[index]
                                .profileUrl,
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
      const DropdownMenuItem(value: "infra", child: Text("Infrastruktur")),
      const DropdownMenuItem(value: "water", child: Text("Sumber Daya Air")),
      const DropdownMenuItem(value: "craft", child: Text("Cipta Karya")),
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
