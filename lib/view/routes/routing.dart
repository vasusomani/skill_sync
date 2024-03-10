import 'package:flutter/material.dart';
import 'package:skill_sync/view/screens/on_boarding_screen/welcome_screen.dart';

import '../screens/auth_screen/login_screen.dart';
import '../screens/auth_screen/signup_screen.dart';

class RouteGenerator extends NavigatorObserver {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case '/signup':
        return MaterialPageRoute(builder: (_) => const SignupScreen());
      default:
        return _errorRoute();
    }
  }
}

Route<dynamic> _errorRoute() {
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
