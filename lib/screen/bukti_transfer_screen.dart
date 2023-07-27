import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:quliku/notifier/pref_notifier.dart';
import 'package:quliku/screen/home_screen.dart';
import 'package:quliku/util/constants.dart';
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
          "Upload Bukti Transfer",
          style: TextStyle(
              color: Constants.COLOR_TITLE, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        child: Expanded(
          child: ListView(
            children: [
              const Text(
                "Total Pembayaran:",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const Text(
                "Rp.12.000.000",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 12,
              ),
              const Text(
                "Kirim ke Rekening BCA Quliku:",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const Text(
                "1234567890",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 16,
              ),
              Expanded(
                flex: 3,
                child: Center(
                    child: image != null
                        ? Image(image: Image.file(image!).image)
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                                Icon(Icons.camera_enhance),
                                Text(
                                  "  Masukkan Bukti Transfer",
                                  style: TextStyle(
                                      color: Constants.COLOR_HINT_TEXT),
                                )
                              ])),
              ),
              const SizedBox(
                height: 16,
              ),
              Expanded(
                flex: 1,
                child: Row(
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
              ),
              const SizedBox(
                height: 16,
              ),
              Expanded(
                flex: 7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Nominal:",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomTextField(
                      hint: "Nominal",
                      icon: Icons.money,
                      callback: (_) => fullname = _,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Text(
                      "Deskripsi:",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextField(
                        onChanged: (_) {},
                        maxLines: 3,
                        decoration: const InputDecoration(
                            hintText: "Deskripsi",
                            hintStyle:
                                TextStyle(color: Constants.COLOR_HINT_TEXT),
                            prefixIcon: Icon(Icons.text_fields),
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Constants.COLOR_MAIN)))),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomButton(
                        text: "Upload",
                        textColor: Colors.white,
                        buttonColor: Constants.COLOR_MAIN,
                        onPressed: () {
                          Constants.showSnackbar(
                              context, "Proyek Berhasil dibuat!");
                          Constants.goto(context, const HomeScreen());
                        })
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
