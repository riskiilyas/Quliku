import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:quliku/notifier/login_notifier.dart';
import 'package:quliku/notifier/notifier_reccomend_mandor.dart';
import 'package:quliku/notifier/register_notifier.dart';
import 'package:quliku/screen/home_screen.dart';
import 'package:quliku/screen/welcome_screen.dart';
import 'package:quliku/util/constants.dart';
import 'package:quliku/util/service_locator.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => ReccomendMandorNotifier()),
    ChangeNotifierProvider(create: (_) => RegisterNotifier()),
    ChangeNotifierProvider(create: (_) => LoginNotifier()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  Widget page = WelcomeScreen();

  void checkLoggedIn() async {
    var prefs = ServiceLocator.prefs;
    prefs.then((value) {
      if(value.getString(Constants.PREF_TOKEN)!=null){
        page = const HomeScreen();
      }
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    checkLoggedIn();
    return GetMaterialApp(
      home: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: AnimatedSplashScreen(
            duration: 2000,
            splashIconSize: 180,
            splash: 'assets/logo_quliku.png',
            splashTransition: SplashTransition.slideTransition,
            pageTransitionType: PageTransitionType.bottomToTop,
            nextScreen: page,
          )),
    );
  }
}
