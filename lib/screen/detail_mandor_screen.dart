import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:quliku/notifier/detail_mandor_notifier.dart';
import 'package:quliku/notifier/pref_notifier.dart';
import 'package:quliku/screen/wishlist_screen.dart';
import 'package:quliku/util/constants.dart';
import 'package:quliku/util/fetch_status.dart';
import 'package:quliku/widget/custom_button.dart';
import 'package:quliku/widget/custom_profile_item.dart';

class DetailMandorPage extends StatelessWidget {
  const DetailMandorPage({Key? key, required this.id}) : super(key: key);
  final String id;

  Future<void> fetch(BuildContext context) async {
    String token = context.read<PrefNotifier>().token;
    return context.read<DetailMandorNotifier>().fetch(token, id);
  }

  Future<void> init(BuildContext context) async {
    context.watch<DetailMandorNotifier>();
    if (context.read<DetailMandorNotifier>().status == FetchStatus.INITIAL) {
      fetch(context);
    }
  }

  Widget favIcon(BuildContext context) {
    var status = context.read<DetailMandorNotifier>().status;
    if (status == FetchStatus.SUCCESS) {
      if (context.read<DetailMandorNotifier>().data.inWishlist) {
        return IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {
              Get.to(() => WishListScreen());
            });
      } else {
        return IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {
              Get.to(() => WishListScreen());
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
      body: SafeArea(
        child:
            context.read<DetailMandorNotifier>().status == FetchStatus.SUCCESS
                ? Column(
                    children: [
                      Expanded(
                        child: RefreshIndicator(
                          color: Constants.COLOR_MAIN,
                          onRefresh: () => fetch(context),
                          child: ListView(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [

                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
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
