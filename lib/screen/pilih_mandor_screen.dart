import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:quliku/screen/agreement_screen.dart';
import 'package:quliku/util/constants.dart';
import 'package:quliku/util/fetch_status.dart';
import 'package:quliku/widget/custom_button.dart';
import 'package:quliku/widget/custom_mandor_item.dart';
import 'package:quliku/widget/custom_text_field.dart';
import 'package:quliku/notifier/register_notifier.dart';

class PilihMandorScreen extends StatefulWidget {
  const PilihMandorScreen(
      {super.key,
      required this.fullname,
      required this.rating,
      required this.experience,
      required this.rangeKuli,
      required this.location,
      required this.imgUrl});

  final String fullname, experience, rangeKuli, location, imgUrl;
  final int rating;

  @override
  State<PilihMandorScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<PilihMandorScreen> {
  String fullname = "";
  String username = "";
  String email = "";
  String password = "";
  String confirmPassword = "";
  FetchStatus status = FetchStatus.INITIAL;
  String loc = "Surabaya";

  void init() async {
    context.watch<RegisterNotifier>();
    status = context.read<RegisterNotifier>().status;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (status == FetchStatus.SUCCESS) {
        context.read<RegisterNotifier>().init();
        Constants.showSnackbar(context, "Successfully Register!");
        Navigator.pop(context);
      } else if (status == FetchStatus.ERROR) {
        context.read<RegisterNotifier>().init();
        Constants.showSnackbar(context, "Failed to Register!");
      }
    });
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

  @override
  Widget build(BuildContext context) {
    init();
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Constants.COLOR_MAIN, //change your color here
        ),
        backgroundColor: Colors.white,
        centerTitle: false,
        title: const Text(
          "Form Penawaran Proyek",
          style: TextStyle(
              color: Constants.COLOR_TITLE, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Mandor yang dipilih',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                                color: Constants.COLOR_TITLE),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          MandorItem(
                              fullname: widget.fullname,
                              rating: widget.rating,
                              experience: widget.experience,
                              rangeKuli: widget.rangeKuli,
                              location: widget.location,
                              imgUrl: widget.imgUrl,
                              onPressed: () {}),
                          const SizedBox(
                            height: 32,
                          ),
                          const Text(
                            'Nama Proyek',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Constants.COLOR_TITLE),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CustomTextField(
                              hint: "Proyek Rumah Minimalis",
                              icon: Icons.abc,
                              callback: (_) => fullname = _,
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            const Text(
                              'Deskripsi',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Constants.COLOR_TITLE),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            TextField(
                                onChanged: (_) {},
                                maxLines: 10,
                                decoration: const InputDecoration(
                                    hintText: "Deskripsi",
                                    hintStyle:
                                    TextStyle(color: Constants.COLOR_HINT_TEXT),
                                    prefixIcon: Icon(Icons.text_fields),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Constants.COLOR_MAIN)))),
                            const SizedBox(
                              height: 8,
                            ),
                            const Text(
                              'Durasi',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Constants.COLOR_TITLE),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: TextField(
                                  onChanged: (_) {},
                                  decoration: const InputDecoration(
                                      hintText: "Tanggal mulai",
                                      hintStyle: TextStyle(
                                          fontSize: 12,
                                          color: Constants.COLOR_HINT_TEXT),
                                      prefixIcon: Icon(Icons.date_range),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Constants.COLOR_MAIN)))),
                            ),
                            SizedBox(width: 12,),
                            Expanded(
                              flex: 1,
                              child: TextField(
                                  onChanged: (_) {},
                                  decoration: const InputDecoration(
                                      hintText: "Tanggal Selesai",
                                      hintStyle: TextStyle(
                                        fontSize: 12,
                                          color: Constants.COLOR_HINT_TEXT,
                                      ),
                                      prefixIcon: Icon(Icons.date_range),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Constants.COLOR_MAIN)))),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 16,
                            ),
                            const Text(
                              'Lokasi Proyek',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Constants.COLOR_TITLE),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            DropdownButton(
                                icon: const Icon(Icons.pin_drop),
                                value: loc,
                                items: dropdownLokasi,
                                onChanged: (_) {setState(() {
                                  loc = _??"Surabaya";
                                });}),
                            TextField(
                                onChanged: (_) {},
                                maxLines: 2,
                                decoration: const InputDecoration(
                                    hintText: "Alamat Lengkap",
                                    hintStyle:
                                    TextStyle(color: Constants.COLOR_HINT_TEXT),
                                    prefixIcon: Icon(Icons.home),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Constants.COLOR_MAIN)))),
                            SizedBox(height: 16,),
                            Container(
                              decoration: BoxDecoration(color: Colors.white),
                              padding: EdgeInsets.only(top: 12),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(flex: 1,child: const Text("Rp.12.000.000", style: TextStyle(fontWeight: FontWeight.bold),)),
                                  Expanded(flex: 1,child: CustomButton(text: "Tawarkan Proyek", textColor: Colors.white, buttonColor: Constants.COLOR_MAIN, onPressed: (){Constants.goto(context, AgreementScreen());}))
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
