import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_furniture/features/authentication/presentation/forgot_password_page.dart';
import 'package:flutter_ecommerce_furniture/features/authentication/presentation/login_page.dart';
import 'package:flutter_ecommerce_furniture/features/authentication/presentation/register_page.dart';
import 'package:flutter_ecommerce_furniture/features/home/presentation/home_page.dart';
import 'package:flutter_ecommerce_furniture/features/welcome/presentation/onboarding_page.dart';
import 'package:flutter_ecommerce_furniture/features/welcome/presentation/welcome_page.dart';

class AppRoutes {
  static const String welcome = '/';
  static const String onboarding = '/onboarding';
  static const String home = '/home';
  static const String login = '/login';
  static const String register = '/register';
  static const String forgotPassword = '/forgot_password';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case onboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingPage());
      case welcome:
        return MaterialPageRoute(builder: (_) => const WelcomePage());
      case home:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case login:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case register:
        return MaterialPageRoute(builder: (_) => const RegisterPage());
      case forgotPassword:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordPage());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
