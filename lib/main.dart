import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:quliku/notifier/notifier_reccomend_mandor.dart';
import 'package:quliku/notifier/register_notifier.dart';
import 'package:quliku/screen/welcome_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiBlocProvider(providers: [
    ChangeNotifierProvider(create: (_) => ReccomendMandorNotifier()),
    ChangeNotifierProvider(create: (_) => RegisterNotifier()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: AnimatedSplashScreen(
            duration: 500,
            splashIconSize: 180,
            splash: 'assets/logo_quliku.png',
            splashTransition: SplashTransition.slideTransition,
            pageTransitionType: PageTransitionType.bottomToTop,
            nextScreen: const WelcomeScreen(),
          )),
    );
  }
}
