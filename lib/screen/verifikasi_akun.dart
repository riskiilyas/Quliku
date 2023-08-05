import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
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

class VerifikasiAkunScreen extends StatefulWidget {
  const VerifikasiAkunScreen({super.key});

  @override
  State<VerifikasiAkunScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<VerifikasiAkunScreen> {
  String usernameOrEmail = "";
  String password = "";
  FetchStatus status = FetchStatus.INITIAL;

  void init() async {
    context.watch<LoginNotifier>();
    status = context.read<LoginNotifier>().status;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (status == FetchStatus.SUCCESS) {
        var data = context.read<LoginNotifier>().loginData!;
        ServiceLocator.prefs.then((pref) {
          pref.setInt(Constants.PREF_UID, data.id);
          pref.setString(Constants.PREF_NAME, data.name);
          pref.setString(Constants.PREF_USERNAME, data.username);
          pref.setString(Constants.PREF_EMAIL, data.email);
          pref.setString(Constants.PREF_ROLE, data.role);
          pref.setString(Constants.PREF_PROFILE_URL, data.profileUrl);
          pref.setString(Constants.PREF_TOKEN, data.token);
          context.read<LoginNotifier>().init();
          Constants.showSnackbar(context, "Selamat datang ${data.name}!");
          Constants.popto(context, const HomeScreen());
        });
      } else if (status == FetchStatus.ERROR) {
        context.read<LoginNotifier>().init();
        Constants.showSnackbar(context, "Gagal Login, Pastikan akun benar!");
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
                      'Kode OTP',
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
                  'Masukkan kode OTP yang terkirim ke email kamu.',
                  style: TextStyle(color: Constants.COLOR_TEXT),
                ),
                const SizedBox(
                  height: 48,
                ),
                Center(
                  child: SizedBox(
                    width: 200,
                    child: Image.asset(
                      'assets/otp.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 48,
                ),
                OtpTextField(
                  numberOfFields: 6,
                  borderColor: Constants.COLOR_MAIN,
                  focusedBorderColor: Constants.COLOR_MAIN,
                  showFieldAsBox: true,
                  styles: List.generate(6, (index) => const TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                  onCodeChanged: (String code) {
                    //handle validation or checks here
                  },
                  //runs when every textfield is filled
                  onSubmit: (String verificationCode){
                    showDialog(
                        context: context,
                        builder: (context){
                          return AlertDialog(
                            title: Text("Verification Code"),
                            content: Text('Code entered is ${int.parse(verificationCode)}'),
                          );
                        }
                    );
                  }, // end onSubmit
                ),
                const SizedBox(
                  height: 48,
                ),
                CustomButton(
                    text: "KIRIM",
                    textColor: Colors.white,
                    buttonColor: Constants.COLOR_MAIN,
                    onPressed: () => {popTo(Routes.WELCOME)}),
                const SizedBox(
                  height: 12,
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
