import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:quliku/screen/home_screen.dart';
import 'package:quliku/screen/login_screen.dart';
import 'package:quliku/screen/register_screen.dart';
import 'package:quliku/util/constants.dart';
import 'package:quliku/util/routes.dart';
import 'package:quliku/util/service_locator.dart';
import 'package:quliku/widget/custom_button.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<SplashScreen> {
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
                        child: Animate(
                          effects: [
                            FadeEffect(duration: 500.ms),
                            ScaleEffect(duration: 500.ms)
                          ],
                          child: SizedBox(
                            width: 200,
                            child: Image.asset(
                              'assets/logo_quliku_new.png',
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SpinKitWave(
                  color: Colors.white,
                ).animate().scale(duration: 500.ms)
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
      // var prefs = ServiceLocator.prefs;
      // prefs.then((value) {
      //   if (value.getString(Constants.PREF_TOKEN) != null) {
      //     Constants.popto(context, const HomeScreen());
      //   }
      // });

      Future.delayed(1.5.seconds, () {
        Navigator.of(context)
            .pushNamedAndRemoveUntil(Routes.WELCOME, (_) => false);
      });
    });
  }
}
