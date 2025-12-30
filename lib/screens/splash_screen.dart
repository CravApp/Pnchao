import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:museo_punchao/utils/app_theme.dart';
import 'package:museo_punchao/widgets/andean_pattern_decoration.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToLogin();
  }

  void _navigateToLogin() {
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        context.go('/login');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryPurple,
      body: AndeanPatternDecoration(
        showTopPattern: true,
        showBottomPattern: true,
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Museum Logo Icon
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primaryPurpleLight,
                    border: Border.all(
                      color: AppColors.accentTurquoise,
                      width: 3,
                    ),
                  ),
                  child: const Icon(
                    Icons.museum,
                    size: 60,
                    color: AppColors.textWhite,
                  ),
                ),
                const SizedBox(height: 32),
                // App Name
                const Text(
                  'MUSEO',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w300,
                    color: AppColors.textWhite,
                    letterSpacing: 8,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'PUNCHAO',
                  style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textWhite,
                    letterSpacing: 4,
                  ),
                ),
                const SizedBox(height: 48),
                // Loading Indicator
                const CircularProgressIndicator(
                  color: AppColors.accentTurquoise,
                  strokeWidth: 3,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
