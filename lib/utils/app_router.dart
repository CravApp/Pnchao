import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:museo_punchao/models/botanical_plant.dart';
import 'package:museo_punchao/screens/splash_screen.dart';
import 'package:museo_punchao/screens/login_screen.dart';
import 'package:museo_punchao/screens/register_screen.dart';
import 'package:museo_punchao/screens/home_screen.dart';
import 'package:museo_punchao/screens/workshop_detail_screen.dart';
import 'package:museo_punchao/screens/botanical_section_screen.dart';
import 'package:museo_punchao/screens/plant_detail_screen.dart';
import 'package:museo_punchao/screens/tickets_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      // Splash Screen
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashScreen(),
      ),
      // Login Screen
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      // Register Screen
      GoRoute(
        path: '/register',
        builder: (context, state) => const RegisterScreen(),
      ),
      // Home Screen
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomeScreen(),
      ),
      // Workshop Detail Screen
      GoRoute(
        path: '/workshop',
        builder: (context, state) => const WorkshopDetailScreen(),
      ),
      // Botanical Section Screen
      GoRoute(
        path: '/botanical',
        builder: (context, state) => const BotanicalSectionScreen(),
      ),
      // Plant Detail Screen
      GoRoute(
        path: '/botanical/:plantId',
        builder: (context, state) {
          final plant = state.extra as BotanicalPlant;
          return PlantDetailScreen(plant: plant);
        },
      ),
      // Tickets Screen
      GoRoute(
        path: '/tickets',
        builder: (context, state) => const TicketsScreen(),
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Text('Page not found: ${state.matchedLocation}'),
      ),
    ),
  );
}
