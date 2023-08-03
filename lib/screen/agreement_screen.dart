import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:quliku/notifier/pref_notifier.dart';
import 'package:quliku/screen/bukti_transfer_screen.dart';
import 'package:quliku/util/constants.dart';
import 'package:quliku/util/routes.dart';
import 'package:quliku/util/user_agreement.dart';
import 'package:quliku/widget/custom_button.dart';

class AgreementScreen extends StatefulWidget {
  const AgreementScreen({super.key});

  @override
  State<AgreementScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<AgreementScreen> {
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
          "Syarat dan Ketentuan",
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
                "[ Pengguna Jasa diwajibkan untuk membaca dan memehami USER AGREEMENT yang telah ditetapkan oleh Quliku sebelum menyetujui USER AGREEMENT berikut. ]",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    "USER AGREEMENT",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Constants.COLOR_MAIN),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const Text(UserAgreement.TEXT),
                  Container(
                    decoration: const BoxDecoration(color: Colors.white),
                    padding: const EdgeInsets.only(top: 12),
                    child: Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: CustomButton(
                                text: "Tidak Setuju",
                                textColor: Colors.white,
                                buttonColor: Constants.COLOR_MAIN,
                                onPressed: () {
                                  Navigator.pop(context);
                                })),
                        Expanded(
                            flex: 1,
                            child: CustomButton(
                                text: "Setuju",
                                textColor: Colors.white,
                                buttonColor: Constants.COLOR_MAIN,
                                onPressed: () {
                                  Navigator.pushNamed(context, Routes.PAYMENT);
                                })),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
