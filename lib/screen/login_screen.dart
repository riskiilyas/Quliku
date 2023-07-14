import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:quliku/animation/transitions.dart';
import 'package:quliku/screen/home_screen.dart';
import 'package:quliku/screen/register_screen.dart';
import 'package:quliku/util/constants.dart';
import 'package:quliku/widget/custom_button.dart';
import 'package:quliku/widget/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<LoginScreen> {
  String usernameOrEmail = "";
  String password = "";
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.of(context)
            .push(Transitions.welcomeRouteTransition(const HomeScreen()));
        setState(() => isLoading = false);
      });
    }
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
                      children: [
                        CustomTextField(
                          hint: "Email/Username",
                          icon: Icons.email,
                          callback: (_) {
                            usernameOrEmail = _;
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
                            onPressed: () =>
                                {setState(() => isLoading = true)}),
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
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 24),
                          child: isLoading
                              ? const SpinKitFadingCircle(
                                  color: Constants.COLOR_MAIN,
                                  size: 50.0,
                                )
                              : null,
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
