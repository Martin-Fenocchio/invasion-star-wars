import 'package:flutter/material.dart';
import 'package:starwars/features/dashboard/screens/character_profile_screen.dart';
import 'package:starwars/features/dashboard/screens/dashboard_screen.dart';
import 'package:starwars/features/splash/splash_screen.dart';
import 'package:starwars/utils/routes/routes_enum.dart';

Map<String, Widget Function(BuildContext)> getRoutes() {
  return {
    RoutesList.splash: (context) => const SplashScreen(),
    RoutesList.dashboard: (context) => const DashboardScreen(),
    RoutesList.profile: (context) => const CharacterProfileScreen(),
  };
}
