import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:quliku/notifier/pref_notifier.dart';
import 'package:quliku/screen/login_screen.dart';
import 'package:quliku/util/constants.dart';
import 'package:quliku/widget/custom_button.dart';
import 'package:quliku/widget/custom_text_field.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<EditProfileScreen> {
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
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
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
          "Edit Profil",
          style: TextStyle(
              color: Constants.COLOR_TITLE, fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Constants.COLOR_MAIN,
        onPressed: () {},
        icon: Icon(Icons.save),
        label: Text('Update'),
      ),
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        child: Expanded(
          child: ListView(
            children: [
              // Column(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: const [
              //     Text(
              //       'Foto Profil',
              //       style: TextStyle(
              //           fontWeight: FontWeight.bold,
              //           fontSize: 20,
              //           color: Constants.COLOR_TITLE),
              //     ),
              //   ],
              // ),
              const SizedBox(
                height: 16,
              ),
              Expanded(
                flex: 3,
                child: Center(
                  child:  CircleAvatar(
                      radius: 64,
                      backgroundImage: image == null
                  ? NetworkImage(context.read<PrefNotifier>().profileUrl)
                      : Image.file(image!).image)
                  ),
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
                  children: [
                    CustomTextField(
                      hint: "Nama Lengkap",
                      icon: Icons.abc,
                      callback: (_) => fullname = _,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomTextField(
                      hint: "Password",
                      icon: Icons.password,
                      callback: (_) => password = _,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomTextField(
                      hint: "Confirm Password",
                      icon: Icons.password,
                      callback: (_) => confirmPassword = _,
                    )
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
