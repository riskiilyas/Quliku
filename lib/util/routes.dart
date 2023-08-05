import 'package:flutter/material.dart';
import 'package:quliku/animation/transitions.dart';
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
        return Transitions.welcomeRouteTransition(const WelcomeScreen());
      case HOME:
        return Transitions.welcomeRouteTransition(const HomeScreen());
      case LOGIN:
        return Transitions.pageRouteTransition(const LoginScreen());
      case REGISTER:
        return Transitions.pageRouteTransition(const RegisterScreen());
      case OFFERING:
        return Transitions.pageRouteTransition(const RegistrasiProyekScreen());
      case AGREEMENT:
        return Transitions.pageRouteTransition(const AgreementScreen());
      case PAYMENT:
        return Transitions.pageRouteTransition(const BuktiTransferScreen());
      case EDIT_PROFILE:
        return Transitions.pageRouteTransition(const EditProfileScreen());
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
