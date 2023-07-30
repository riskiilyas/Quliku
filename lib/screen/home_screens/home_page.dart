import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:quliku/model/model/mandor_data.dart';
import 'package:quliku/notifier/detail_mandor_notifier.dart';
import 'package:quliku/notifier/notifier_reccomend_mandor.dart';
import 'package:quliku/notifier/pref_notifier.dart';
import 'package:quliku/screen/detail_mandor_screen.dart';
import 'package:quliku/util/fetch_status.dart';
import 'package:quliku/util/service_locator.dart';
import 'package:quliku/widget/custom_mandor_item.dart';
import '../../util/constants.dart';
import '../../widget/custom_klasifikasi_button.dart';

class HomePage extends StatefulWidget {
  final Function() onCariMandor;

  const HomePage({Key? key, required this.onCariMandor}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var name = "";

  void init(BuildContext context) async {
    context.watch<PrefNotifier>();
    name = context.read<PrefNotifier>().name;
  }

  @override
  Widget build(BuildContext context) {
    init(context);
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
        child: RefreshIndicator(
          color: Constants.COLOR_MAIN,
          onRefresh: () {
            return ServiceLocator.prefs.then((pref) {
              context
                  .read<ReccomendMandorNotifier>()
                  .fetch(pref.getString(Constants.PREF_TOKEN) ?? "");
            });
          },
          child: ListView(
            children: [
              const SizedBox(
                height: 24,
              ),
              Text(
                "Halo, $name",
                style: const TextStyle(
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
                onTap: () {
                  widget.onCariMandor();
                },
                child: Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(24)),
                      border:
                          Border.all(width: 4, color: Constants.COLOR_MAIN),
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
                height: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget _reccomendMandorWidget(BuildContext context) {
  //   var status = context.watch<ReccomendMandorNotifier>().status;
  //   if (status == FetchStatus.SUCCESS) {
  //     reccomendMandor = context.watch<ReccomendMandorNotifier>().data;
  //     return Column(
  //       children: List.generate(
  //           reccomendMandor.length,
  //           (index) => MandorItem(
  //                 fullname: reccomendMandor[index].name,
  //                 rating: reccomendMandor[index].rating,
  //                 experience: reccomendMandor[index].details.experience,
  //                 rangeKuli:
  //                     "${reccomendMandor[index].details.minPeople} - ${reccomendMandor[index].details.maxPeople} kuli",
  //                 location: reccomendMandor[index].details.city,
  //                 imgUrl: reccomendMandor[index].profileUrl,
  //                 onPressed: () {
  //                   context.read<DetailMandorNotifier>().init();
  //                   Constants.goto(
  //                       context,
  //                       DetailMandorPage(
  //                         id: reccomendMandor[index].id,
  //                       ));
  //                 },
  //               )),
  //     );
  //   } else {
  //     if (status == FetchStatus.INITIAL) {
  //       ServiceLocator.prefs.then((pref) {
  //         context
  //             .read<ReccomendMandorNotifier>()
  //             .fetch(pref.getString(Constants.PREF_TOKEN) ?? "");
  //       });
  //       var response = context.watch<ReccomendMandorNotifier>().data;
  //       reccomendMandor = response;
  //     }
  //     return const SpinKitFadingCircle(
  //       color: Constants.COLOR_MAIN,
  //       size: 50.0,
  //     );
  //   }
  // }
}
