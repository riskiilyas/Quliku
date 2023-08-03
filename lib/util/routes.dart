import 'package:flutter/material.dart';
import 'package:quliku/screen/agreement_screen.dart';
import 'package:quliku/screen/bukti_transfer_screen.dart';
import 'package:quliku/screen/edit_profile_screen.dart';
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
  static const AGREEMENT = '/agreement';
  static const PAYMENT = '/payment';
  static const EDIT_PROFILE = '/edit_profile';

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
      case AGREEMENT:
        return MaterialPageRoute(builder: (_) => const AgreementScreen(),);
      case PAYMENT:
        return MaterialPageRoute(builder: (_) => const BuktiTransferScreen(),);
      case EDIT_PROFILE:
        return MaterialPageRoute(builder: (_) => const EditProfileScreen(),);
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
