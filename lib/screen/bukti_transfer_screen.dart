import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:quliku/notifier/pref_notifier.dart';
import 'package:quliku/screen/home_screen.dart';
import 'package:quliku/util/constants.dart';
import 'package:quliku/util/routes.dart';
import 'package:quliku/widget/custom_button.dart';
import 'package:quliku/widget/custom_text_field.dart';

class BuktiTransferScreen extends StatefulWidget {
  const BuktiTransferScreen({super.key});

  @override
  State<BuktiTransferScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<BuktiTransferScreen> {
  String fullname = "";
  String username = "";
  String email = "";
  String password = "";
  String confirmPassword = "";
  File? image;

  Future pickImage(ImageSource source) async {
    try {
      print('nninjnini');
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      setState(() => this.image = File(image.path));
    } on PlatformException {
      // print('Failed to pick image: $e');
    }
  }

  Future<bool> validateForm() async {
    return true;
  }

  @override
  Widget build(BuildContext context) {
    context.watch<PrefNotifier>();
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Constants.COLOR_MAIN, //change your color here
        ),
        backgroundColor: Colors.white,
        title: const Text(
          "Lakukan Pembayaran",
          style: TextStyle(
              color: Constants.COLOR_MAIN, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    Card(
                      child: Padding(
                        padding:
                            const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                        child: Column(
                          children: const [
                            Text(
                              "Transfer pada na rekeninng yang tertera, kemudian kirimkan "
                              "bukti transfer",
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      child: Padding(
                        padding:
                            const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/bank/bri.png',
                                      width: 16,
                                    ),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    const Text(
                                      "BANK BRI",
                                      style: TextStyle(
                                          color: Constants.COLOR_TITLE,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                                const Text(
                                  "QulikuIndonesia",
                                  style: TextStyle(
                                      color: Constants.COLOR_TITLE,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            const Text(
                              "No. Rekening",
                              style: TextStyle(
                                  color: Constants.COLOR_TITLE,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const Text(
                                  "0111-01-058258-50-71",
                                  style: TextStyle(
                                      color: Constants.COLOR_TITLE,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                InkWell(
                                  onTap: () {
                                    Constants.showSnackbar(
                                        context,
                                        "Rekening "
                                        "Tersalin");
                                  },
                                  child: const Icon(
                                    Icons.copy,
                                    color: Constants.COLOR_HINT_TEXT,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 32,
                            )
                          ],
                        ),
                      ),
                    ),
                    Card(
                      child: Padding(
                        padding:
                            const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                        child: Column(
                          children: [
                            const Text(
                              "Upload Bukti Pembayaran",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Constants.COLOR_MAIN,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            InkWell(
                                onTap: () {},
                                child: image == null ? DottedBorder(
                                  borderType: BorderType.RRect,
                                  color: Constants.COLOR_MAIN,
                                  child: Container(
                                    color: Colors.grey.shade200,
                                    width: double.infinity,
                                    height: 160,
                                    child: const Center(child: Icon(Icons.add, size: 48,
                                      color: Constants.COLOR_MAIN,)),
                                  ),
                                ) : Image(image: Image.file(image!).image)),
                            const SizedBox(height: 16,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: CustomButton(
                                      text: "Kamera",
                                      textColor: Constants.COLOR_MAIN,
                                      buttonColor: Colors.white,
                                      onPressed: () {
                                        pickImage(ImageSource.camera);
                                      }),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: CustomButton(
                                      text: "Galeri",
                                      textColor: Colors.white,
                                      buttonColor: Constants.COLOR_MAIN,
                                      onPressed: () {
                                        pickImage(ImageSource.gallery);
                                      }),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              CustomButton(text: "Kirim", textColor: Colors.white, buttonColor:
              Constants.COLOR_MAIN, onPressed: (){})
            ],
          )),
    );
  }
}
