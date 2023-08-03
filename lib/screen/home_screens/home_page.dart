import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:quliku/model/model/mandor_data.dart';
import 'package:quliku/notifier/detail_mandor_notifier.dart';
import 'package:quliku/notifier/notifier_reccomend_mandor.dart';
import 'package:quliku/notifier/pref_notifier.dart';
import 'package:quliku/screen/detail_mandor_screen.dart';
import 'package:quliku/screen/registrasi_proyek_screen.dart';
import 'package:quliku/util/dev.dart';
import 'package:quliku/util/fetch_status.dart';
import 'package:quliku/util/routes.dart';
import 'package:quliku/util/service_locator.dart';
import 'package:quliku/widget/custom_mandor_item.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
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
              Container(
                padding: const EdgeInsets.only(left: 12, right: 12, top: 12),
                decoration: BoxDecoration(
                  color: Constants.COLOR_MAIN,
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  border: Border.all(width: 4, color: Constants.COLOR_MAIN),
                ),
                child: Stack(
                    clipBehavior: Clip.none,
                    fit: StackFit.passthrough,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            "assets/mandor_home_page.png",
                            width: 69,
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "Hai, $name Riski Ilyas",
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  textAlign: TextAlign.end,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                const Text(
                                  "Ada yang perlu diperbaiki?",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Positioned(
                        right: 0.0,
                        bottom: -30,
                        child: InkWell(
                          onTap: () {},
                          child: Image.asset("assets/logo_wa.png"),
                        ),
                      ),
                    ]),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "Jasa Layanan Kami",
                style: TextStyle(
                    color: Constants.COLOR_TITLE,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 4,
              ),
              const Text(
                "Apa permasalahan anda?",
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
                          text: "Konsultan",
                          imgUrl: "assets/konsultan.png",
                          onPressed: () => {
                            Navigator.of(context).pushNamed(Routes.OFFERING)
                          }),
                      KlasifikasiButton(
                          text: "Tukang",
                          imgUrl: "assets/tukang.png",
                          onPressed: () => {
                            Navigator.of(context).pushNamed(Routes.OFFERING)
                          }),
                      KlasifikasiButton(
                          text: "Mandor",
                          imgUrl: "assets/mandor.png",
                          onPressed: () => {
                            Navigator.of(context).pushNamed(Routes.OFFERING)
                          })
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              const Text(
                "Pesan Tukang Langsung",
                style: TextStyle(
                    color: Constants.COLOR_TITLE,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 8,
              ),
              Card(
                elevation: 2,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        "Renovasi",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Constants.COLOR_MAIN,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          KlasifikasiButton(
                              text: "Pipa",
                              imgUrl: "assets/pipa.png",
                              onPressed: () {},
                              space: 0),
                          KlasifikasiButton(
                              text: "Pagar",
                              imgUrl: "assets/pagar.png",
                              onPressed: () {},
                              space: 0),
                          KlasifikasiButton(
                              text: "Cat",
                              imgUrl: "assets/cat.png",
                              onPressed: () {},
                              space: 0),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          KlasifikasiButton(
                            text: "Dinding",
                            imgUrl: "assets/dinding.png",
                            onPressed: () {},
                            space: 0,
                          ),
                          KlasifikasiButton(
                              text: "Keramik",
                              imgUrl: "assets/keramik.png",
                              onPressed: () {},
                              space: 0),
                          KlasifikasiButton(
                              text: "Genteng",
                              imgUrl: "assets/genteng.png",
                              onPressed: () {},
                              space: 0),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const Text(
                        "Elektronik",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Constants.COLOR_MAIN,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          KlasifikasiButton(
                              text: "AC",
                              imgUrl: "assets/ac.png",
                              onPressed: () {},
                              space: 0),
                          KlasifikasiButton(
                              text: "Listrik",
                              imgUrl: "assets/listrik.png",
                              onPressed: () {},
                              space: 0),
                          KlasifikasiButton(
                              text: "Kipas Angin",
                              imgUrl: "assets/kipas.png",
                              onPressed: () {},
                              space: 0),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              const Text(
                "Cari tau, info untuk rumah impianmu",
                style: TextStyle(
                    color: Constants.COLOR_TITLE,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 12,
              ),
              SizedBox(
                height: 280,
                child: ListView(
                  // This next line does the trick.
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                      6,
                      (index) => Padding(
                            padding: const EdgeInsets.only(right: 4),
                            child: SizedBox(
                              height: 220,
                              width: 150,
                              child: InkWell(
                                onTap: () {},
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12)),
                                  elevation: 2,
                                  child: ClipPath(
                                    clipper: ShapeBorderClipper(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12))),
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          "assets/article_img_demo.png",
                                          fit: BoxFit.fitWidth,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(4),
                                          child: Expanded(
                                            child: Column(
                                              children: [
                                                const Text(
                                                  "Judul Artikel Disini",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color:
                                                          Constants.COLOR_TEXT),
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                const SizedBox(
                                                  height: 4,
                                                ),
                                                Text(
                                                  Dev.LOREM,
                                                  maxLines: 9,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                      color: Constants
                                                          .COLOR_HINT_TEXT),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              const SizedBox(
                height: 24,
              )
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
