import 'package:flutter/material.dart';
import 'package:quliku/util/Constants.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<WelcomeScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<WelcomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                children: [
                  Card(
                    elevation: 4,
                    child: SizedBox(
                      width: double.infinity,
                      child: InkWell(
                        onTap: () => {
                          // TODO LOGIN
                        },
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Constants.COLOR_MAIN),
                          height: 50,
                          child: const Text(
                            'Masuk',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Card(
                    elevation: 4,
                    child: SizedBox(
                      width: double.infinity,
                      child: InkWell(
                        onTap: () => {
                          // TODO REGISTER
                        },
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          height: 50,
                          child: const Text(
                            'Daftar',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Constants.COLOR_MAIN),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
