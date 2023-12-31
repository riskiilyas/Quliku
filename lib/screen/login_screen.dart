import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:quliku/notifier/login_notifier.dart';
import 'package:quliku/screen/home_screen.dart';
import 'package:quliku/util/constants.dart';
import 'package:quliku/util/extensions.dart';
import 'package:quliku/util/fetch_status.dart';
import 'package:quliku/util/routes.dart';
import 'package:quliku/util/service_locator.dart';
import 'package:quliku/widget/custom_button.dart';
import 'package:quliku/widget/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<LoginScreen> {
  String email = "";
  String password = "";
  FetchStatus status = FetchStatus.INITIAL;

  void init() async {
    context.watch<LoginNotifier>();
    status = context.read<LoginNotifier>().status;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (status == FetchStatus.SUCCESS) {
        var data = context.read<LoginNotifier>().loginData!;
        ServiceLocator.prefs.then((pref) {
          pref.setString(Constants.PREF_ROLE, data.role);
          pref.setString(Constants.PREF_TOKEN, data.token);
          pref.setString(Constants.PREF_EMAIL, email);
          pref.setString(Constants.PREF_PASSWORD, password);
          context.read<LoginNotifier>().init();
          Constants.popto(context, const HomeScreen());
        });
      } else if (status == FetchStatus.ERROR) {
        context.read<LoginNotifier>().init();
        Constants.showSnackbar(context, loginNotifier.error);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    init();
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Masuk',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Constants.COLOR_MAIN),
                ),
                InkWell(
                  onTap: () => goBack(),
                  child: const Icon(
                    Icons.arrow_back,
                    color: Constants.COLOR_MAIN,
                  ),
                )
              ],
            ),
            const Divider(
              color: Constants.COLOR_MAIN,
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              'Gunakan akun yang telah didaftarkan!',
              style: TextStyle(color: Constants.COLOR_TEXT),
            ),
            const SizedBox(
              height: 48,
            ),
            Center(
              child: SizedBox(
                width: 280,
                child: Image.asset(
                  'assets/login_img.png',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(
              height: 48,
            ),
            CustomTextField(
              hint: "Email",
              icon: Icons.email,
              callback: (_) {
                email = _;
              },
            ),
            const SizedBox(
              height: 8,
            ),
            CustomTextField(
              hint: "Password",
              icon: Icons.password,
              callback: (_) {
                password = _;
              },
            ),
            const SizedBox(
              height: 32,
            ),
            CustomButton(
                text: "MASUK",
                textColor: Colors.white,
                buttonColor: Constants.COLOR_MAIN,
                onPressed: () => {
                Constants.popto(context, const HomeScreen())
                // loginNotifier.fetch(email, password)
                }),
            const SizedBox(
              height: 12,
            ),
            Row(
              children: [
                const Text(
                  'Belum Punya Akun? ',
                  style:
                      TextStyle(color: Constants.COLOR_HINT_TEXT, fontSize: 16),
                ),
                InkWell(
                  onTap: () => jumpTo(Routes.REGISTER),
                  child: const Text(
                    'Yuk Daftar!',
                    style: TextStyle(
                        color: Constants.COLOR_MAIN,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: status == FetchStatus.LOADING
                  ? const SpinKitFadingCircle(
                      color: Constants.COLOR_MAIN,
                      size: 50.0,
                    )
                  : null,
            ),
          ],
        ),
      )),
    );
  }
}
