import 'package:flutter/material.dart';
import 'package:quliku/screen/home_screen.dart';
import 'package:quliku/screen/login_screen.dart';
import 'package:quliku/screen/register_screen.dart';
import 'package:quliku/screen/registrasi_proyek_screen.dart';
import 'package:quliku/screen/splash_screen.dart';
import 'package:quliku/screen/welcome_screen.dart';

class Routes {
  static const ROOT = '/';
  static const WELCOME = '/welcome';
  static const HOME = '/home';
  static const LOGIN = '/login';
  static const REGISTER = '/register';
  static const OFFERING = '/offering';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case ROOT:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case WELCOME:
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
      case HOME:
        return MaterialPageRoute(builder: (_) => const HomeScreen(),);
      case LOGIN:
        return MaterialPageRoute(builder: (_) => const LoginScreen(),);
      case REGISTER:
        return MaterialPageRoute(builder: (_) => const RegisterScreen(),);
      case OFFERING:
        return MaterialPageRoute(builder: (_) => const RegistrasiProyekScreen(),);
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
