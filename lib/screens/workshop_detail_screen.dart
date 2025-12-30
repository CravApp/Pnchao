import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:museo_punchao/models/workshop.dart';
import 'package:museo_punchao/utils/app_theme.dart';
import 'package:museo_punchao/widgets/info_card.dart';
import 'package:museo_punchao/widgets/primary_button.dart';

class WorkshopDetailScreen extends StatelessWidget {
  const WorkshopDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final workshop = Workshop.getSampleWorkshops()[0];

    return Scaffold(
      backgroundColor: AppColors.primaryPurple,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // App Bar with Hero Image
            SliverAppBar(
              expandedHeight: 250,
              pinned: true,
              backgroundColor: AppColors.primaryPurple,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  fit: StackFit.expand,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            AppColors.primaryPurpleLight,
                            AppColors.primaryPurple,
                          ],
                        ),
                      ),
                      child: const Icon(
                        Icons.palette,
                        size: 100,
                        color: AppColors.accentTurquoise,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            AppColors.primaryPurple.withValues(alpha: 0.8),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Content
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Workshop Title
                    Text(
                      workshop.title,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textWhite,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      workshop.subtitle,
                      style: const TextStyle(
                        fontSize: 16,
                        color: AppColors.textGrey,
                      ),
                    ),
                    const SizedBox(height: 24),
                    // Workshop Info
                    Row(
                      children: [
                        const Icon(
                          Icons.access_time,
                          color: AppColors.accentTurquoise,
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '${workshop.durationHours} horas',
                          style: const TextStyle(
                            color: AppColors.textWhite,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(width: 24),
                        const Icon(
                          Icons.people,
                          color: AppColors.accentTurquoise,
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Máx. ${workshop.maxParticipants} personas',
                          style: const TextStyle(
                            color: AppColors.textWhite,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    // Description
                    Text(
                      workshop.description,
                      style: const TextStyle(
                        color: AppColors.textWhite,
                        fontSize: 16,
                        height: 1.6,
                      ),
                    ),
                    const SizedBox(height: 32),
                    // Phases Section
                    const Text(
                      'Fases del Taller',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textWhite,
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Phase Cards
                    ...workshop.phases.map((phase) => _buildPhaseCard(phase)),
                    const SizedBox(height: 32),
                    // Price
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: AppColors.accentTurquoise.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: AppColors.accentTurquoise,
                          width: 2,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Precio',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: AppColors.textWhite,
                            ),
                          ),
                          Text(
                            'S/ ${workshop.price.toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: AppColors.accentTurquoise,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 100), // Space for floating button
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      // Floating Register Button
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: PrimaryButton(
          text: 'REGÍSTRATE',
          icon: Icons.check_circle_outline,
          width: double.infinity,
          onPressed: () {
            _showRegistrationDialog(context);
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _buildPhaseCard(WorkshopPhase phase) {
    return InfoCard(
      title: 'Fase ${phase.number}: ${phase.title}',
      description: '${phase.description}\n\n'
          'Duración: ${phase.durationMinutes} minutos\n\n'
          'Actividades:\n${phase.activities.map((a) => '• $a').join('\n')}',
      icon: Icons.stars,
    );
  }

  void _showRegistrationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.primaryPurpleLight,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: const Text(
          '¡Registro Exitoso!',
          style: TextStyle(color: AppColors.textWhite),
        ),
        content: const Text(
          'Te has registrado exitosamente al taller.\n\nRecibirás un correo con los detalles de confirmación.',
          style: TextStyle(color: AppColors.textWhite),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              context.pop();
            },
            child: const Text(
              'ACEPTAR',
              style: TextStyle(color: AppColors.accentTurquoise),
            ),
          ),
        ],
      ),
    );
  }
}
