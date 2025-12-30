import 'package:flutter/material.dart';
import 'package:museo_punchao/utils/app_theme.dart';
import 'package:museo_punchao/utils/app_router.dart';

void main() {
  runApp(const MuseoPunchaoApp());
}

class MuseoPunchaoApp extends StatelessWidget {
  const MuseoPunchaoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Museo Punchao',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      routerConfig: AppRouter.router,
    );
  }
}
