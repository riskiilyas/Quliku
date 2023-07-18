import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:quliku/model/response/mandor_item.dart';
import 'package:quliku/notifier/notifier_reccomend_mandor.dart';
import 'package:quliku/util/fetch_status.dart';
import 'package:quliku/widget/custom_mandor_item.dart';
import '../../util/constants.dart';
import '../../widget/custom_klasifikasi_button.dart';

class HomePage extends StatelessWidget {
  final Function() onCariMandor;

  HomePage({Key? key, required this.onCariMandor}) : super(key: key);
  List<Mandor> reccomendMandor = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
        child: Expanded(
          child: RefreshIndicator(
            color: Constants.COLOR_MAIN,
            onRefresh: () {
              return context.read<ReccomendMandorNotifier>().fetch();
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
                  onTap: () {
                    onCariMandor();
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
                  height: 8,
                ),
                _reccomendMandorWidget(context),
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

  Widget _reccomendMandorWidget(BuildContext context) {
    var status = context.watch<ReccomendMandorNotifier>().status;
    if (status == FetchStatus.SUCCESS) {
      reccomendMandor = context.watch<ReccomendMandorNotifier>().data;
      return Column(
        children: List.generate(
            reccomendMandor.length,
            (index) => MandorItem(
                  fullname: reccomendMandor[index].name,
                  rating: reccomendMandor[index].rating,
                  experience: reccomendMandor[index].experience,
                  rangeKuli:
                      "${reccomendMandor[index].minKuli} - ${reccomendMandor[index].maxKuli} kuli",
                  location: reccomendMandor[index].location,
                  imgUrl: "assets/dummy-profile.png",
                  onPressed: () => {},
                )),
      );
    } else {
      if (status == FetchStatus.INITIAL) {
        context.read<ReccomendMandorNotifier>().fetch();
        var response = context.watch<ReccomendMandorNotifier>().data;
        if (response != null) {
          reccomendMandor = response;
        }
      }
      return const SpinKitFadingCircle(
        color: Constants.COLOR_MAIN,
        size: 50.0,
      );
    }
  }
}
