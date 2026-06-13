import 'package:cocoquest/features/home/screens/home_screen.dart';
import 'package:cocoquest/features/splash/screens/splash_screen.dart';
import 'package:cocoquest/features/onboarding/screens/hatching_screen.dart';
import 'package:cocoquest/core/routes/app_routes.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case AppRoutes.hatching:
        return MaterialPageRoute(builder: (_) => const HatchingScreen());

      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      default:
        throw Exception('Route not found: ${settings.name}');
    }
  }
}
