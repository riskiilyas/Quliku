import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:quliku/util/constants.dart';
import 'package:quliku/util/extensions.dart';
import 'package:quliku/util/fetch_status.dart';
import 'package:quliku/util/routes.dart';
import 'package:quliku/widget/custom_button.dart';
import 'package:quliku/widget/custom_text_field.dart';
import 'package:quliku/notifier/register_notifier.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<RegisterScreen> {
  String fullname = "";
  String username = "";
  String email = "";
  String password = "";
  String confirmPassword = "";
  FetchStatus status = FetchStatus.INITIAL;

  void init() async {
    context.watch<RegisterNotifier>();
    status = context.read<RegisterNotifier>().status;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (status == FetchStatus.SUCCESS) {
        context.read<RegisterNotifier>().init();
        Constants.showSnackbar(context, "Successfully Register!");
        goBack();
      } else if (status == FetchStatus.ERROR) {
        context.read<RegisterNotifier>().init();
        Constants.showSnackbar(context,
            "Failed to Register! ${context.read<RegisterNotifier>().error}");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    init();
    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Daftar',
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
                  height: 4,
                ),
                const Text(
                  'Yuk segera daftarkan dirimu!',
                  style: TextStyle(color: Constants.COLOR_TEXT),
                ),
                const SizedBox(
                  height: 16,
                ),
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
                ),
                const SizedBox(
                  height: 24,
                ),
                status != FetchStatus.LOADING && status != FetchStatus.SUCCESS
                    ? CustomButton(
                        text: "DAFTAR",
                        textColor: Colors.white,
                        buttonColor: Constants.COLOR_MAIN,
                        onPressed: () => goTo(Routes.VERIFICATION)
                        // context.read<RegisterNotifier>().fetch(fullname,
                        //     username, email, password, confirmPassword);
                        )
                    : const SpinKitFadingCircle(
                        color: Constants.COLOR_MAIN,
                        size: 50.0,
                      ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    const Text(
                      'Sudah Punya Akun? ',
                      style: TextStyle(
                          color: Constants.COLOR_HINT_TEXT, fontSize: 16),
                    ),
                    InkWell(
                      onTap: () => jumpTo(Routes.LOGIN),
                      child: const Text(
                        'Masuk',
                        style: TextStyle(
                            color: Constants.COLOR_MAIN,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            alignment: Alignment.bottomRight,
            child: Image.asset(
              "assets/bg_quliku_icon.png",
              width: 256,
              alignment: Alignment.bottomRight,
            ),
          ),
        ],
      )),
    );
  }
}
