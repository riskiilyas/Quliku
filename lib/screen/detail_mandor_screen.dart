import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:popup_banner/popup_banner.dart';
import 'package:provider/provider.dart';
import 'package:quliku/notifier/detail_mandor_notifier.dart';
import 'package:quliku/notifier/pref_notifier.dart';
import 'package:quliku/notifier/wishlist_mandor_notifier.dart';
import 'package:quliku/screen/pilih_mandor_screen.dart';
import 'package:quliku/util/constants.dart';
import 'package:quliku/util/fetch_status.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DetailMandorPage extends StatefulWidget {
  const DetailMandorPage({Key? key, required this.id}) : super(key: key);
  final String id;

  @override
  State<DetailMandorPage> createState() => _DetailMandorPageState();
}

class _DetailMandorPageState extends State<DetailMandorPage> {
  CarouselController sertifikatController = CarouselController();

  CarouselController portfolioController = CarouselController();

  PageController sertifikatPageController = PageController();

  Future<void> fetch(BuildContext context) async {
    String token = context.read<PrefNotifier>().token;
    return context.read<DetailMandorNotifier>().fetch(token, widget.id);
  }

  Future<void> init(BuildContext context) async {
    context.watch<DetailMandorNotifier>();
    if (context.read<DetailMandorNotifier>().status == FetchStatus.INITIAL) {
      fetch(context);
    }
  }

  Future<bool> delete(BuildContext context, int id) async {
    var token = context.read<PrefNotifier>().token;
    return context.read<WishlistMandorNotifier>().delete(token, id);
  }

  Future<bool> add(BuildContext context, int id) async {
    var token = context.read<PrefNotifier>().token;
    return context.read<WishlistMandorNotifier>().add(token, id);
  }

  Widget favIcon(BuildContext context) {
    var status = context.read<DetailMandorNotifier>().status;
    if (status == FetchStatus.SUCCESS) {
      var id = context.read<DetailMandorNotifier>().data.id;
      var token = context.read<PrefNotifier>().token;
      if (context.read<DetailMandorNotifier>().data.inWishlist) {
        return IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {
              delete(context, id).then((value) {
                Constants.showSnackbar(
                    context, "Berhasil Mendhapus dari Favorit!");
                context
                    .read<DetailMandorNotifier>()
                    .fetch(token, id.toString());
              });
            });
      } else {
        return IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {
              add(context, id).then((value) {
                Constants.showSnackbar(
                    context, "Berhasil Menambahkan ke Favorit!");
                context
                    .read<DetailMandorNotifier>()
                    .fetch(token, id.toString());
              });
            });
      }
    } else {
      return const SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    init(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Constants.COLOR_MAIN, //change your color here
        ),
        backgroundColor: Colors.white,
        centerTitle: false,
        title: const Text(
          "Detail Mandor",
          style: TextStyle(
              color: Constants.COLOR_TITLE, fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[favIcon(context)],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Constants.COLOR_MAIN,
        onPressed: () {
          Constants.goto(
              context,
              PilihMandorScreen(
                fullname: context.read<DetailMandorNotifier>().data.name,
                rating: context.read<DetailMandorNotifier>().data.rating,
                experience: context
                    .read<DetailMandorNotifier>()
                    .data
                    .details
                    .experience,
                rangeKuli:
                    " ${context.read<DetailMandorNotifier>().data.details.minPeople} - ${context.read<DetailMandorNotifier>().data.details.maxPeople} kuli",
                location:
                    context.read<DetailMandorNotifier>().data.details.city,
                imgUrl: context.read<DetailMandorNotifier>().data.profileUrl,
              ));
        },
        icon: const Icon(Icons.add_home_work_outlined),
        label: const Text('Pilih Mandor'),
      ),
      body: SafeArea(
        child: context.read<DetailMandorNotifier>().status ==
                FetchStatus.SUCCESS
            ? Expanded(
                child: RefreshIndicator(
                  color: Constants.COLOR_MAIN,
                  onRefresh: () => fetch(context),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 24, horizontal: 16),
                    child: ListView(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage(context
                                  .read<DetailMandorNotifier>()
                                  .data
                                  .profileUrl),
                              radius: 64,
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Text(
                              context.read<DetailMandorNotifier>().data.name,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  color: Constants.COLOR_TEXT,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Constants.COLOR_MAIN,
                                  size: 14,
                                ),
                                Text(
                                  "${context.read<DetailMandorNotifier>().data.rating} | ",
                                  style: const TextStyle(
                                    color: Constants.COLOR_TEXT,
                                  ),
                                ),
                                const Icon(
                                  Icons.bar_chart,
                                  color: Constants.COLOR_TEXT,
                                  size: 14,
                                ),
                                Text(
                                  "${context.read<DetailMandorNotifier>().data.details.experience} Tahun | ",
                                  style: const TextStyle(
                                    color: Constants.COLOR_TEXT,
                                  ),
                                ),
                                const Icon(
                                  Icons.groups,
                                  color: Constants.COLOR_TEXT,
                                  size: 14,
                                ),
                                Text(
                                  " ${context.read<DetailMandorNotifier>().data.details.minPeople} - ${context.read<DetailMandorNotifier>().data.details.maxPeople} kuli",
                                  style: const TextStyle(
                                    color: Constants.COLOR_TEXT,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.pin_drop,
                                  color: Constants.COLOR_TEXT,
                                  size: 14,
                                ),
                                Text(
                                  context
                                      .read<DetailMandorNotifier>()
                                      .data
                                      .details
                                      .city,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: Constants.COLOR_TEXT,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        const Divider(),
                        const SizedBox(
                          height: 24,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Klasifikasi",
                              style: TextStyle(
                                  color: Constants.COLOR_TEXT,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              "Mandor ${context.read<DetailMandorNotifier>().data.details.classification}",
                              style: const TextStyle(
                                  color: Constants.COLOR_MAIN,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            const Text(
                              "Deskripsi",
                              style: TextStyle(
                                  color: Constants.COLOR_TEXT,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                                context
                                    .read<DetailMandorNotifier>()
                                    .data
                                    .details
                                    .description,
                                style: const TextStyle(
                                  color: Constants.COLOR_TEXT,
                                  fontSize: 14,
                                )),
                            const SizedBox(
                              height: 24,
                            ),
                            const Text(
                              "Harga per Meter Persegi",
                              style: TextStyle(
                                  color: Constants.COLOR_TEXT,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            const Text("Rp.100.000,00",
                                style: TextStyle(
                                  color: Constants.COLOR_TEXT,
                                  fontSize: 14,
                                )),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  height: 24,
                                ),
                                const Divider(),
                                const Text(
                                  "Sertifikasi",
                                  style: TextStyle(
                                      color: Constants.COLOR_TEXT,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                CarouselSlider(
                                  items: List.generate(
                                      context
                                          .read<DetailMandorNotifier>()
                                          .data
                                          .images
                                          .where((element) =>
                                              element.type == "certificate")
                                          .length, (index) {
                                    return InkWell(
                                      onTap: () {
                                        PopupBanner(
                                          height: null,
                                          fit: BoxFit.fitWidth,
                                          context: context,
                                          images: [
                                            context
                                                .read<DetailMandorNotifier>()
                                                .data
                                                .images
                                                .where((element) =>
                                            element.type == "certificate")
                                                .toList(growable: true)[index]
                                                .photoUrl,
                                          ],
                                          onClick: (index) {},
                                        ).show();
                                      },
                                      child: Image.network(
                                          context
                                              .read<DetailMandorNotifier>()
                                              .data
                                              .images
                                              .where((element) =>
                                                  element.type == "certificate")
                                              .toList(growable: true)[index]
                                              .photoUrl,
                                          fit: BoxFit.fitWidth,
                                          loadingBuilder: (BuildContext context,
                                              Widget child,
                                              ImageChunkEvent? loadingProgress) {
                                            if (loadingProgress == null) {
                                              return child;
                                            }
                                            return Center(
                                              child: CircularProgressIndicator(
                                                value: loadingProgress
                                                            .expectedTotalBytes !=
                                                        null
                                                    ? loadingProgress
                                                            .cumulativeBytesLoaded /
                                                        loadingProgress
                                                            .expectedTotalBytes!
                                                    : null,
                                              ),
                                            );
                                          },
                                        ),
                                    );
                                  }),
                                  carouselController: sertifikatController,
                                  options: CarouselOptions(
                                    onPageChanged: (_, __) {
                                      sertifikatPageController.jumpToPage(_);
                                    },
                                    autoPlay: false,
                                    enlargeCenterPage: true,
                                    viewportFraction: 0.9,
                                    aspectRatio: 2.0,
                                    initialPage: 2,
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                SmoothPageIndicator(
                                  controller: sertifikatPageController,
                                  // PageController
                                  effect: const ExpandingDotsEffect(
                                      activeDotColor: Constants.COLOR_MAIN),
                                  // your preferred effect
                                  onDotClicked: (index) {
                                    sertifikatController.animateToPage(index);
                                  },
                                  count: context
                                      .read<DetailMandorNotifier>()
                                      .data
                                      .images
                                      .where((element) =>
                                          element.type == "certificate")
                                      .length,
                                ),
                                const SizedBox(
                                  height: 24,
                                ),
                                const Text(
                                  "Dokumentasi Pengalaman Proyek",
                                  style: TextStyle(
                                      color: Constants.COLOR_TEXT,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                CarouselSlider(
                                  items: List.generate(
                                      context
                                          .read<DetailMandorNotifier>()
                                          .data
                                          .images
                                          .where((element) =>
                                              element.type == "portfolio")
                                          .length, (index) {
                                    return Image.network(
                                      context
                                          .read<DetailMandorNotifier>()
                                          .data
                                          .images
                                          .where((element) =>
                                              element.type == "portfolio")
                                          .toList(growable: true)[index]
                                          .photoUrl,
                                      fit: BoxFit.fitWidth,
                                      loadingBuilder: (BuildContext context,
                                          Widget child,
                                          ImageChunkEvent? loadingProgress) {
                                        if (loadingProgress == null) {
                                          return child;
                                        }
                                        return Center(
                                          child: CircularProgressIndicator(
                                            value: loadingProgress
                                                        .expectedTotalBytes !=
                                                    null
                                                ? loadingProgress
                                                        .cumulativeBytesLoaded /
                                                    loadingProgress
                                                        .expectedTotalBytes!
                                                : null,
                                          ),
                                        );
                                      },
                                    );
                                  }),
                                  carouselController: sertifikatController,
                                  options: CarouselOptions(
                                    onPageChanged: (_, __) {
                                      sertifikatPageController.jumpToPage(_);
                                    },
                                    autoPlay: false,
                                    enlargeCenterPage: true,
                                    viewportFraction: 0.9,
                                    aspectRatio: 2.0,
                                    initialPage: 2,
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                SmoothPageIndicator(
                                  controller: sertifikatPageController,
                                  // PageController
                                  effect: const ExpandingDotsEffect(
                                      activeDotColor: Constants.COLOR_MAIN),
                                  // your preferred effect
                                  onDotClicked: (index) {
                                    sertifikatController.animateToPage(index);
                                  },
                                  count: context
                                      .read<DetailMandorNotifier>()
                                      .data
                                      .images
                                      .where((element) =>
                                          element.type == "portfolio")
                                      .length,
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 36,
                        )
                      ],
                    ),
                  ),
                ),
              )
            : const Center(
                child: SpinKitFadingCircle(
                  color: Constants.COLOR_MAIN,
                  size: 50.0,
                ),
              ),
      ),
    );
  }
}
