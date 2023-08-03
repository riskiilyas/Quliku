import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:quliku/notifier/detail_mandor_notifier.dart';
import 'package:quliku/notifier/login_notifier.dart';
import 'package:quliku/notifier/notifier_reccomend_mandor.dart';
import 'package:quliku/notifier/register_notifier.dart';
import 'package:quliku/notifier/wishlist_mandor_notifier.dart';
import 'package:quliku/screen/home_screen.dart';
import 'package:quliku/screen/welcome_screen.dart';
import 'package:quliku/util/constants.dart';
import 'package:quliku/util/routes.dart';
import 'package:quliku/util/service_locator.dart';
import 'package:quliku/notifier/pref_notifier.dart';
import 'package:quliku/notifier/search_mandor_notifier.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => PrefNotifier()),
    ChangeNotifierProvider(create: (_) => ReccomendMandorNotifier()),
    ChangeNotifierProvider(create: (_) => SearchMandorNotifier()),
    ChangeNotifierProvider(create: (_) => DetailMandorNotifier()),
    ChangeNotifierProvider(create: (_) => WishlistMandorNotifier()),
    ChangeNotifierProvider(create: (_) => RegisterNotifier()),
    ChangeNotifierProvider(create: (_) => LoginNotifier()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  Widget page = const WelcomeScreen();

  void checkLoggedIn() async {
    var prefs = ServiceLocator.prefs;
    prefs.then((value) {
      if (value.getString(Constants.PREF_TOKEN) != null) {
        page = const HomeScreen();
      }
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    context.read<PrefNotifier>().init();
    checkLoggedIn();
    return MaterialApp(
          title: 'Quliku',
          theme: ThemeData(
            primarySwatch: Colors.orange,
          ),
          initialRoute: Routes.ROOT,
          onGenerateRoute: Routes.generateRoute,
          debugShowCheckedModeBanner: false,
          // home: AnimatedSplashScreen(
          //   duration: 2000,
          //   splashIconSize: 180,
          //   backgroundColor: Constants.COLOR_MAIN,
          //   splash: 'assets/logo_quliku_new.png',
          //   splashTransition: SplashTransition.slideTransition,
          //   pageTransitionType: PageTransitionType.bottomToTop,
          //   nextScreen: const WelcomeScreen(),
          // )
    );
  }
}
