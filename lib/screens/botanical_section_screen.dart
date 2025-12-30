import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:museo_punchao/models/botanical_plant.dart';
import 'package:museo_punchao/utils/app_theme.dart';

class BotanicalSectionScreen extends StatelessWidget {
  const BotanicalSectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final plants = BotanicalPlant.getSamplePlants();

    return Scaffold(
      backgroundColor: AppColors.primaryPurple,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Sección Botánica'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              // Header
              const Text(
                'SECCIÓN BOTÁNICA',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textWhite,
                  letterSpacing: 2,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Plantas Nativas del Perú',
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.textGrey,
                ),
              ),
              const SizedBox(height: 40),
              // Plant Grid
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 24,
                    mainAxisSpacing: 24,
                    childAspectRatio: 0.85,
                  ),
                  itemCount: plants.length,
                  itemBuilder: (context, index) {
                    final plant = plants[index];
                    return _buildPlantCard(context, plant);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPlantCard(BuildContext context, BotanicalPlant plant) {
    return GestureDetector(
      onTap: () {
        context.push('/botanical/${plant.id}', extra: plant);
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.primaryPurpleLight,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: AppColors.accentTurquoise,
            width: 2,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Plant Icon
            Container(
              width: 80,
              height: 80,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.cardBackground,
              ),
              child: Icon(
                _getPlantIcon(plant.id),
                size: 40,
                color: AppColors.textWhite,
              ),
            ),
            const SizedBox(height: 16),
            // Plant Name
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                plant.name.toUpperCase(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textWhite,
                  letterSpacing: 1,
                ),
              ),
            ),
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                plant.scientificName,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 11,
                  fontStyle: FontStyle.italic,
                  color: AppColors.textGrey,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
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
