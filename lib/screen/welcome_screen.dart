import 'package:flutter/material.dart';
import 'package:quliku/screen/home_screen.dart';
import 'package:quliku/screen/login_screen.dart';
import 'package:quliku/screen/register_screen.dart';
import 'package:quliku/util/constants.dart';
import 'package:quliku/util/routes.dart';
import 'package:quliku/util/service_locator.dart';
import 'package:quliku/widget/custom_button.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Constants.COLOR_MAIN,
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 24),
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: SizedBox(
                          width: 200,
                          child: Image.asset(
                            'assets/logo_quliku_new.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 48,
                      ),
                      Column(
                        children: [
                          CustomButton(
                              text: "Daftar",
                              width: 200,
                              textColor: Constants.COLOR_MAIN,
                              buttonColor: Colors.white,
                              onPressed: () => {
                                    Navigator.of(context).pushNamed(
                                      Routes.REGISTER,
                                    )
                                  }),
                          const SizedBox(
                            height: 12,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Sudah punya akun? ",
                                style: TextStyle(color: Colors.white),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).pushNamed(
                                    Routes.LOGIN,
                                  );
                                },
                                child: const Text(
                                  "Masuk",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
                const Text(
                  "Dengan melanjutkan, Anda dianggap telah menyetujui Ketentuan  Penggunaan dan Kebijakan Privasi",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
        ));
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // do something
      var prefs = ServiceLocator.prefs;
      prefs.then((value) {
        if (value.getString(Constants.PREF_TOKEN) != null) {
          Constants.popto(context, const HomeScreen());
        }
      });
    });
  }
}
