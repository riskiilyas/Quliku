import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:quliku/screen/login_screen.dart';
import 'package:quliku/util/constants.dart';
import 'package:quliku/widget/custom_button.dart';
import 'package:quliku/widget/custom_text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<RegisterScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<RegisterScreen> {
  String fullname = "";
  String username = "";
  String email = "";
  String password = "";
  String confirmPassword = "";

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
                            'Daftar',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                                color: Constants.COLOR_TITLE),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            'Yuk segera daftarkan dirimu!',
                            style: TextStyle(color: Constants.COLOR_TEXT),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Expanded(
                    flex: 3,
                    child: Center(
                      child: SizedBox(
                        width: 160,
                        child: Image.asset(
                          'assets/register_img.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Expanded(
                    flex: 5,
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
                          hint: "Username",
                          icon: Icons.person,
                          callback: (_) => username = _,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        CustomTextField(
                          hint: "Email",
                          icon: Icons.email,
                          callback: (_) => email = _,
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
                  const SizedBox(
                    height: 24,
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        CustomButton(
                            text: "DAFTAR",
                            textColor: Colors.white,
                            buttonColor: Constants.COLOR_MAIN,
                            onPressed: () => {}),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            const Text(
                              'Sudah Punya Akun? ',
                              style: TextStyle(
                                  color: Constants.COLOR_HINT_TEXT,
                                  fontSize: 16),
                            ),
                            InkWell(
                              onTap: () => {
                                // Constants.goto(LoginScreen(blocContext: widget.blocContext))
                              },
                              child: const Text(
                                'Masuk',
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
