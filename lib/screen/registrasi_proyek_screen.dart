import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:quliku/screen/agreement_screen.dart';
import 'package:quliku/util/constants.dart';
import 'package:quliku/util/fetch_status.dart';
import 'package:quliku/widget/custom_button.dart';
import 'package:quliku/notifier/register_notifier.dart';

class RegistrasiProyekScreen extends StatefulWidget {
  const RegistrasiProyekScreen({super.key});

  @override
  State<RegistrasiProyekScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<RegistrasiProyekScreen> {
  String fullname = "";
  String username = "";
  String email = "";
  String password = "";
  String confirmPassword = "";
  FetchStatus status = FetchStatus.INITIAL;
  String loc = "Surabaya";
  DateTime start = DateTime.now();
  DateTime finish = DateTime.now();
  int tCat = 1;
  List<File> imgs = [];

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      setState(() => imgs.add(File(image.path)));
    } on PlatformException {
      // print('Failed to pick image: $e');
    }
  }

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
        body: SafeArea(
            child: Container(
      color: Constants.COLOR_MAIN,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(16)),
            child: Stack(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    color: Constants.COLOR_MAIN_TEXT,
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Row(
                  children: const [
                    Expanded(
                        child: Text(
                      "Membuat Pesanan",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Constants.COLOR_MAIN_TEXT),
                    )),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Expanded(
            child: ListView(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Cat",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      TextField(
                          onChanged: (_) {},
                          decoration: const InputDecoration(
                            hintText: "Detail perbaikan yang dibutuhkan",
                            hintStyle:
                                TextStyle(color: Constants.COLOR_HINT_TEXT),
                          )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Kelupas cat lama"),
                          Checkbox(value: false, onChanged: (_) {})
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Cat ulang"),
                          Checkbox(value: false, onChanged: (_) {})
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Cat pagar"),
                          Checkbox(value: false, onChanged: (_) {})
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Deskripsi detail kerusakan",
                        style: TextStyle(fontSize: 18),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextField(
                          onChanged: (_) {},
                          minLines: 10,
                          maxLines: 20,
                          decoration: const InputDecoration(
                              hintText: "Deskripsi",
                              hintStyle:
                                  TextStyle(color: Constants.COLOR_HINT_TEXT),
                              prefixIcon: Icon(Icons.text_fields),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Constants.COLOR_MAIN)))),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: pickImage,
                        child: Card(
                          color: Constants.COLOR_MAIN_TEXT,
                          elevation: 8,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Constants.COLOR_MAIN_TEXT,
                                borderRadius: BorderRadius.circular(8)),
                            padding: const EdgeInsets.all(12),
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.upload,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                Text(
                                  "Upload foto kerusakan",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: imgs.isNotEmpty ? 150 : 0,
                        child: ListView(
                          // This next line does the trick.
                          scrollDirection: Axis.horizontal,
                          children: List.generate(
                              imgs.length,
                              (index) => Padding(
                                    padding: const EdgeInsets.only(right: 4),
                                    child: SizedBox(
                                      height: 150,
                                      child: Stack(children: [
                                        InkWell(
                                            onTap: () {
                                              Constants.showImage(
                                                  context, imgs[index]);
                                            },
                                            child: Image.file(imgs[index])),
                                        Positioned(
                                            top: 0,
                                            left: 0,
                                            child: InkWell(
                                              onTap: () {
                                                setState(() {
                                                  imgs.remove(imgs[index]);
                                                });
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    color: Colors.grey.shade200
                                                        .withOpacity(0.8)),
                                                child: const Icon(
                                                  Icons.delete,
                                                  color:
                                                      Constants.COLOR_MAIN_TEXT,
                                                ),
                                              ),
                                            )),
                                      ]),
                                    ),
                                  )),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Alamat",
                        style: TextStyle(fontSize: 18),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          const Text("Kota : "),
                          DropdownButton(
                              icon: const Icon(Icons.pin_drop),
                              value: loc,
                              items: dropdownLokasi,
                              onChanged: (_) {
                                setState(() {
                                  loc = _ ?? "Surabaya";
                                });
                              }),
                        ],
                      ),
                      TextField(
                          onChanged: (_) {},
                          minLines: 3,
                          maxLines: 10,
                          decoration: const InputDecoration(
                              hintText: "Masukkan Alamat Anda",
                              hintStyle:
                                  TextStyle(color: Constants.COLOR_HINT_TEXT),
                              prefixIcon: Icon(Icons.home),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Constants.COLOR_MAIN)))),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Estimasi",
                        style: TextStyle(
                            fontSize: 18,
                            color: Constants.COLOR_MAIN_TEXT,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Tanggal",
                        style: TextStyle(
                            fontSize: 18,
                            color: Constants.COLOR_MAIN_TEXT,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Durasi",
                        style: TextStyle(
                            fontSize: 18,
                            color: Constants.COLOR_MAIN_TEXT,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: InkWell(
                              onTap: () {
                                showDatePicker(
                                        context: context,
                                        initialDate: start,
                                        //get today's date
                                        firstDate: DateTime(2000),
                                        //DateTime.now() - not to allow to choose before today.
                                        lastDate: DateTime(2101))
                                    .then((value) {
                                  if (value != null) {
                                    setState(() {
                                      start = value;
                                    });
                                  }
                                });
                              },
                              child: TextField(
                                  enabled: false,
                                  onChanged: (_) {},
                                  decoration: InputDecoration(
                                      helperText: "Tanggal Mulai",
                                      helperStyle: const TextStyle(
                                          fontSize: 12,
                                          color: Constants.COLOR_TEXT),
                                      hintText: DateFormat('dd/MM/yyyy')
                                          .format(start),
                                      hintStyle: const TextStyle(
                                          fontSize: 12,
                                          color: Constants.COLOR_TEXT),
                                      prefixIcon: const Icon(Icons.date_range),
                                      border: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Constants.COLOR_MAIN)))),
                            ),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Expanded(
                            flex: 1,
                            child: InkWell(
                              onTap: () {
                                showDatePicker(
                                        context: context,
                                        initialDate: finish,
                                        firstDate: DateTime(2000),
                                        lastDate: DateTime(2101))
                                    .then((value) {
                                  if (value != null) {
                                    setState(() {
                                      finish = value;
                                    });
                                  }
                                });
                              },
                              child: TextField(
                                  enabled: false,
                                  onChanged: (_) {},
                                  decoration: InputDecoration(
                                      helperText: "Tanggal Selesai",
                                      helperStyle: const TextStyle(
                                          fontSize: 12,
                                          color: Constants.COLOR_TEXT),
                                      hintText: DateFormat('dd/MM/yyyy')
                                          .format(finish),
                                      hintStyle: const TextStyle(
                                        fontSize: 12,
                                        color: Constants.COLOR_TEXT,
                                      ),
                                      prefixIcon: const Icon(Icons.date_range),
                                      border: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Constants.COLOR_MAIN)))),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            "assets/mandor.png",
                            width: 20,
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          const Text(
                            "Jenis Tukang",
                            style: TextStyle(
                                fontSize: 18,
                                color: Constants.COLOR_MAIN_TEXT,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.grey, width: 1)),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  "assets/cat.png",
                                  width: 36,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                const Expanded(
                                    child: Text("Tukang Cat",
                                        style: TextStyle(fontSize: 18))),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      tCat++;
                                    });
                                  },
                                  child: Container(
                                      width: 32,
                                      height: 32,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(64),
                                          color: Colors.grey),
                                      child: const Center(
                                          child: Text(
                                        "+",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 24),
                                      ))),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text("$tCat",
                                    style: const TextStyle(fontSize: 24)),
                                const SizedBox(
                                  width: 8,
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      if (tCat > 0) tCat--;
                                    });
                                  },
                                  child: Container(
                                      width: 32,
                                      height: 32,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(64),
                                          color: Colors.grey),
                                      child: const Center(
                                          child: Text(
                                        "-",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 24),
                                      ))),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(16)),
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("Jumlah Biaya:"),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        "Rp. 100.000.000",
                        style: TextStyle(
                            color: Constants.COLOR_MAIN,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                    flex: 1,
                    child: CustomButton(
                        text: "Pembayaran",
                        textColor: Colors.white,
                        buttonColor: Constants.COLOR_MAIN_TEXT,
                        onPressed: () {
                          Constants.goto(context, const AgreementScreen());
                        })),
              ],
            ),
          ),
        ],
      ),
    )));
  }
}
