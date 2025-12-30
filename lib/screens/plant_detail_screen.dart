import 'package:flutter/material.dart';
import 'package:museo_punchao/models/botanical_plant.dart';
import 'package:museo_punchao/utils/app_theme.dart';

class PlantDetailScreen extends StatelessWidget {
  final BotanicalPlant plant;

  const PlantDetailScreen({
    super.key,
    required this.plant,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryPurple,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // App Bar with Hero Image
            SliverAppBar(
              expandedHeight: 280,
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
                            AppColors.cardBackground,
                            AppColors.primaryPurple,
                          ],
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 140,
                            height: 140,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.primaryPurpleLight,
                              border: Border.all(
                                color: AppColors.accentTurquoise,
                                width: 3,
                              ),
                            ),
                            child: Icon(
                              _getPlantIcon(plant.id),
                              size: 70,
                              color: AppColors.textWhite,
                            ),
                          ),
                        ],
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
                    // Plant Title
                    Text(
                      plant.name.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textWhite,
                        letterSpacing: 2,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      plant.scientificName,
                      style: const TextStyle(
                        fontSize: 18,
                        fontStyle: FontStyle.italic,
                        color: AppColors.accentTurquoise,
                      ),
                    ),
                    const SizedBox(height: 24),
                    // Long Description
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: AppColors.cardBackground,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        plant.longDescription,
                        style: const TextStyle(
                          color: AppColors.textWhite,
                          fontSize: 16,
                          height: 1.6,
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    // Properties Section
                    const Text(
                      'Propiedades',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textWhite,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: plant.properties.map((property) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.accentTurquoise.withValues(alpha: 0.3),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: AppColors.accentTurquoise,
                              width: 1,
                            ),
                          ),
                          child: Text(
                            property,
                            style: const TextStyle(
                              color: AppColors.textWhite,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 32),
                    // Uses Section
                    const Text(
                      'Usos',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textWhite,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ...plant.uses.map((use) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.check_circle,
                              color: AppColors.accentTurquoise,
                              size: 20,
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                use,
                                style: const TextStyle(
                                  color: AppColors.textWhite,
                                  fontSize: 16,
                                  height: 1.5,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getPlantIcon(String plantId) {
    switch (plantId) {
      case 'una_de_gato':
        return Icons.spa;
      case 'maca':
        return Icons.eco;
      case 'muna':
        return Icons.local_florist;
      case 'hercampuri':
        return Icons.nature;
      default:
        return Icons.local_florist;
    }
  }
}
