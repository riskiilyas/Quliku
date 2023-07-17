import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:quliku/screen/welcome_screen.dart';
import 'bloc/bloc_reccomend_mandor.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
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
            duration: 2000,
            splashIconSize: 180,
            splash: 'assets/logo_quliku.png',
            splashTransition: SplashTransition.slideTransition,
            pageTransitionType: PageTransitionType.bottomToTop,
            nextScreen: MultiBlocProvider(
              providers: [
                BlocProvider(create: (_) => ReccomendMandorBloc()),
              ],
              child: const WelcomeScreen(),
            ),
          )),
    );
  }
}
