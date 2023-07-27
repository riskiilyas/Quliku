import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:quliku/notifier/detail_mandor_notifier.dart';
import 'package:quliku/notifier/pref_notifier.dart';
import 'package:quliku/notifier/wishlist_mandor_notifier.dart';
import 'package:quliku/screen/detail_mandor_screen.dart';
import 'package:quliku/util/constants.dart';
import 'package:quliku/util/fetch_status.dart';
import 'package:quliku/widget/custom_removable_mandor_item.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<WishListScreen> {
  Future<void> init(BuildContext context) async {
    context.watch<WishlistMandorNotifier>();
    if (context.read<WishlistMandorNotifier>().status == FetchStatus.INITIAL) {
      fetch(context);
    }
  }

  Future<void> fetch(BuildContext context) async {
    var token = context.read<PrefNotifier>().token;
    context.read<WishlistMandorNotifier>().fetch(token);
  }

  Future<bool> delete(BuildContext context, int id) async {
    var token = context.read<PrefNotifier>().token;
    return context.read<WishlistMandorNotifier>().delete(token, id);
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
          "Mandor Favorit",
          style: TextStyle(
              color: Constants.COLOR_TITLE, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Expanded(
              child: RefreshIndicator(
                color: Constants.COLOR_MAIN,
                onRefresh: () {
                  return fetch(context);
                },
                child: context.read<WishlistMandorNotifier>().status ==
                        FetchStatus.SUCCESS
                    ? ListView.builder(
                        itemCount:
                            context.read<WishlistMandorNotifier>().data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return RemovableMandorItem(
                            fullname: context
                                .read<WishlistMandorNotifier>()
                                .data[index]
                                .name,
                            rating: context
                                .read<WishlistMandorNotifier>()
                                .data[index]
                                .rating,
                            experience: context
                                .read<WishlistMandorNotifier>()
                                .data[index]
                                .details
                                .experience,
                            rangeKuli:
                                "${context.read<WishlistMandorNotifier>().data[index].details.minPeople} - ${context.read<WishlistMandorNotifier>().data[index].details.maxPeople} kuli",
                            location: context
                                .read<WishlistMandorNotifier>()
                                .data[index]
                                .details
                                .city,
                            imgUrl: context
                                .read<WishlistMandorNotifier>()
                                .data[index]
                                .profileUrl,
                            onPressed: () {
                              context.read<DetailMandorNotifier>().init();
                              Constants.goto(
                                  context,
                                  DetailMandorPage(
                                    id: context
                                        .read<WishlistMandorNotifier>()
                                        .data[index]
                                        .id,
                                  ));
                            },
                            onRemoved: () {
                              Constants.showMyDialog(
                                  context, "Ingin Hapus dari mandor favorit?",
                                  (result) {
                                if (result) {
                                  delete(
                                          context,
                                          int.parse(context
                                              .read<WishlistMandorNotifier>()
                                              .data[index]
                                              .id))
                                      .then((value) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content: Text('Mandor Dihapus')));
                                  });
                                }
                              });
                            },
                          );
                        })
                    : const Center(
                        child: SpinKitFadingCircle(
                          color: Constants.COLOR_MAIN,
                          size: 50.0,
                        ),
                      ),
              ),
            )),
      ),
    );
  }
}
