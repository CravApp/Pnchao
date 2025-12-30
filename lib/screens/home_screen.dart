import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:museo_punchao/utils/app_theme.dart';
import 'package:museo_punchao/widgets/andean_pattern_decoration.dart';
import 'package:museo_punchao/widgets/circular_icon_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryPurple,
      body: AndeanPatternDecoration(
        showTopPattern: true,
        showBottomPattern: true,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                // Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'MUSEO',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                            color: AppColors.textWhite,
                            letterSpacing: 3,
                          ),
                        ),
                        Text(
                          'PUNCHAO',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: AppColors.textWhite,
                            letterSpacing: 2,
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.account_circle,
                        size: 36,
                        color: AppColors.accentTurquoise,
                      ),
                      onPressed: () {
                        // Show user menu
                        _showUserMenu(context);
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 60),
                // Main Menu Sections
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Workshop Section
                      CircularIconButton(
                        icon: Icons.palette,
                        label: 'TALLER DE CERÁMICA\nY BOTÁNICA',
                        size: 140,
                        onTap: () {
                          context.push('/workshop');
                        },
                      ),
                      const SizedBox(height: 50),
                      // Botanical Section
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircularIconButton(
                            icon: Icons.local_florist,
                            label: 'SECCIÓN\nBOTÁNICA',
                            size: 120,
                            onTap: () {
                              context.push('/botanical');
                            },
                          ),
                          CircularIconButton(
                            icon: Icons.confirmation_number,
                            label: 'ENTRADAS',
                            size: 120,
                            onTap: () {
                              context.push('/tickets');
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showUserMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.primaryPurpleLight,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.person, color: AppColors.accentTurquoise),
              title: const Text(
                'Mi Perfil',
                style: TextStyle(color: AppColors.textWhite),
              ),
              onTap: () {
                Navigator.pop(context);
                // Navigate to profile
              },
            ),
            ListTile(
              leading: const Icon(Icons.history, color: AppColors.accentTurquoise),
              title: const Text(
                'Mis Reservas',
                style: TextStyle(color: AppColors.textWhite),
              ),
              onTap: () {
                Navigator.pop(context);
                // Navigate to bookings
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings, color: AppColors.accentTurquoise),
              title: const Text(
                'Configuración',
                style: TextStyle(color: AppColors.textWhite),
              ),
              onTap: () {
                Navigator.pop(context);
                // Navigate to settings
              },
            ),
            const Divider(color: AppColors.textGrey),
            ListTile(
              leading: const Icon(Icons.logout, color: AppColors.error),
              title: const Text(
                'Cerrar Sesión',
                style: TextStyle(color: AppColors.error),
              ),
              onTap: () {
                Navigator.pop(context);
                context.go('/login');
              },
            ),
          ],
        ),
      ),
    );
  }
}
