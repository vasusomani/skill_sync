import 'package:flutter/material.dart';
import 'package:skill_sync/view/screens/chat_screen/chat_screen.dart';
import 'package:skill_sync/view/screens/on_boarding_screen/welcome_screen.dart';

import '../screens/auth_screen/login_screen.dart';
import '../screens/auth_screen/signup_screen.dart';
import '../screens/chat_screen/recent_chat_screen.dart';
import '../screens/home_screen/home_screen.dart';
import '../screens/projects_screen/my_projects_screen.dart';
import '../screens/projects_screen/my_requests_screen.dart';

class RouteGenerator extends NavigatorObserver {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case '/signup':
        return MaterialPageRoute(builder: (_) => const SignupScreen());
      case '/home':
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case '/my_projects':
        return MaterialPageRoute(builder: (_) => const MyProjectsScreen());
      case '/my_requests':
        return MaterialPageRoute(builder: (_) => const MyRequestsScreen());
      case '/recent_chats':
        return MaterialPageRoute(builder: (_) => const RecentChatScreen());
      case '/chat':
        return MaterialPageRoute(builder: (_) => const ChatScreen());
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
