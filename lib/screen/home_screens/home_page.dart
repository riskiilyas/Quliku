import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:quliku/model/response/mandor_item.dart';
import 'package:quliku/widget/custom_mandor_item.dart';
import '../../util/constants.dart';
import '../../widget/custom_klasifikasi_button.dart';
import '../../bloc/bloc_reccomend_mandor.dart';

class HomePage extends StatelessWidget {
  final Function() onCariMandor;
  final BuildContext blocContext;

  HomePage({Key? key, required this.blocContext, required this.onCariMandor})
      : super(key: key);
  List<Mandor> reccomendMandor = [];
  // FetchStatus status = FetchStatus.INITIAL;
  late ReccomendMandorBloc bloc;
  //
  // void _setup() async {
  //   if (status == FetchStatus.INITIAL) {
  //     status == FetchStatus.LOADING;
  //     ReccomendMandorResponse response =
  //         await ServiceLocator.network.getReccomendedMandor();
  //     try {
  //       reccomendMandor = response.list;
  //       status = FetchStatus.FINISH;
  //     } catch (e) {
  //       status = FetchStatus.ERROR;
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    bloc = BlocProvider.of<ReccomendMandorBloc>(blocContext);
    bloc.add(ReccomendMandorEvent());
    return SafeArea(
      child: BlocBuilder(
        builder: (context, state) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
            child: Expanded(
              child: RefreshIndicator(
                color: Constants.COLOR_MAIN,
                onRefresh: () {
                  return Future.delayed(
                    Duration(seconds: 2),
                        () {},
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
                    state is ReccomendMandorStateSuccess
                        ? Column(
                      children: List.generate(
                          state.data.list.length,
                              (index) => MandorItem(
                            fullname: state.data.list[index].name,
                            rating: state.data.list[index].rating,
                            experience: state.data.list[index].experience,
                            rangeKuli: "${state.data.list[index].minKuli} - ${state.data.list[index].maxKuli} kuli",
                            location: state.data.list[index].location,
                            imgUrl: "assets/dummy-profile.png",
                            onPressed: () => {},
                          )),
                    )
                        : const SpinKitFadingCircle(
                      color: Constants.COLOR_MAIN,
                      size: 50.0,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
