import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:quliku/util/constants.dart';
import 'package:quliku/util/extensions.dart';
import 'package:quliku/util/fetch_status.dart';
import 'package:quliku/util/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<SplashScreen> {

  void checkLoggedIn() async {
    prefNotifier.init().then((value) {
      var email = prefNotifier.email;
      var password = prefNotifier.password;

      loginNotifier.fetch(email, password).then((data) {
        Future.delayed(1.5.seconds, () {
          if(loginNotifier.status==FetchStatus.SUCCESS) {
            prefNotifier.setEmail(email);
            prefNotifier.setUsername(loginNotifier.loginData!.username);
            prefNotifier.setPassword(password);
            prefNotifier.setId(loginNotifier.loginData!.id);
            prefNotifier.setName(loginNotifier.loginData!.name);
            prefNotifier.setProfileUrl(loginNotifier.loginData!.profileUrl);
            prefNotifier.setRole(loginNotifier.loginData!.role);
            prefNotifier.setToken(loginNotifier.loginData!.token);

            popTo(Routes.HOME);
          } else {
            popTo(Routes.WELCOME);
          }
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    checkLoggedIn();
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
}
