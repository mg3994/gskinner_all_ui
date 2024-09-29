import 'package:flutter/material.dart';

import '../features/home_Screen.dart';

class Routes {
  static const List<String> routes = [
    home,
    login,
    register,
    forgotPassword,
    resetPassword,
    verifyEmail,
    changePassword,
    profile,
    settings,
    about,
    help,
    faq,
    contact,
    terms,
    privacy,
    feedback,
  ];
  static const String home = '/home';
  static const String login = '/login';
  static const String register = '/register';
  static const String forgotPassword = '/forgot-password';
  static const String resetPassword = '/reset-password';
  static const String verifyEmail = '/verify-email';
  static const String changePassword = '/change-password';
  static const String profile = '/profile';
  static const String settings = '/settings';
  static const String about = '/about';
  static const String help = '/help';
  static const String faq = '/faq';
  static const String contact = '/contact';
  static const String terms = '/terms';
  static const String privacy = '/privacy';
  static const String feedback = '/feedback';
}

class AppRoutes {
  static const String initial = '/';
  static const String home = '/home';

  static String getInitialRoute() => initial;

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final String? name = settings.name;
    final Map<String, dynamic>? arguments =
        settings.arguments as Map<String, dynamic>?;

    switch (name) {
      case home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                body: Center(child: Text('No route defined for $name'))));
    }
  }
}
