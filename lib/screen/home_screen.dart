import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quliku/screen/login_screen.dart';
import 'package:quliku/screen/register_screen.dart';
import 'package:quliku/util/Constants.dart';
import 'package:quliku/widget/custom_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Constants.COLOR_MAIN, //change your color here
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        centerTitle: false,
        title: const Text(
          "Quliku",
          style: TextStyle(
              color: Constants.COLOR_TITLE, fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          IconButton(icon: const Icon(Icons.favorite), onPressed: () {}),
          IconButton(icon: const Icon(Icons.location_city), onPressed: () {}),
        ],
      ),
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 16),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: SizedBox(
                  width: 128,
                  child: Image.asset(
                    'assets/logo_quliku.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Expanded(
              child: Center(
                child: SizedBox(
                  width: 256,
                  child: Image.asset(
                    'assets/homepage_img.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 48,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomButton(
                      text: "Masuk",
                      textColor: Colors.white,
                      buttonColor: Constants.COLOR_MAIN,
                      onPressed: () => {Get.to(const LoginScreen())}),
                  const SizedBox(
                    height: 4,
                  ),
                  CustomButton(
                      text: "Daftar",
                      textColor: Constants.COLOR_MAIN,
                      buttonColor: Colors.white,
                      onPressed: () => {Get.to(const RegisterScreen())})
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
