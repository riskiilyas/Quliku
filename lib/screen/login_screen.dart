import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quliku/screen/register_screen.dart';
import 'package:quliku/util/Constants.dart';
import 'package:quliku/widget/custom_button.dart';
import 'package:quliku/widget/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<LoginScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<LoginScreen> {
  String usernameOrEmail = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Masuk',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                                color: Constants.COLOR_TITLE),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            'Gunakan akun yang telah didaftarkan!',
                            style: TextStyle(color: Constants.COLOR_TEXT),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 48,
                  ),
                  Expanded(
                    flex: 3,
                    child: Center(
                      child: SizedBox(
                        width: 280,
                        child: Image.asset(
                          'assets/login_img.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 48,
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: const [
                        CustomTextField(
                            hint: "Email/Username", icon: Icons.email),
                        SizedBox(
                          height: 8,
                        ),
                        CustomTextField(hint: "Password", icon: Icons.password),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        CustomButton(
                            text: "MASUK",
                            textColor: Colors.white,
                            buttonColor: Constants.COLOR_MAIN,
                            onPressed: () => {}),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            const Text(
                              'Belum Punya Akun? ',
                              style: TextStyle(
                                  color: Constants.COLOR_HINT_TEXT,
                                  fontSize: 16),
                            ),
                            InkWell(
                              onTap: () => {Get.to(const RegisterScreen())},
                              child: const Text(
                                'Yuk Daftar!',
                                style: TextStyle(
                                    color: Constants.COLOR_MAIN,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        )
                      ],
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
