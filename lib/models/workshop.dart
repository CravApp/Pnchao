class Workshop {
  final String id;
  final String title;
  final String subtitle;
  final String description;
  final String imagePath;
  final List<WorkshopPhase> phases;
  final int durationHours;
  final double price;
  final int maxParticipants;

  Workshop({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.imagePath,
    required this.phases,
    required this.durationHours,
    required this.price,
    required this.maxParticipants,
  });

  // Sample workshops for the museum
  static List<Workshop> getSampleWorkshops() {
    return [
      Workshop(
        id: 'ceramica_botanica',
        title: 'Taller de Cerámica y Botánica',
        subtitle: 'Explora la conexión entre el arte ancestral y la naturaleza',
        description:
            'Un taller inmersivo que combina técnicas tradicionales de cerámica andina con el estudio de plantas nativas. Aprenderás a crear piezas únicas inspiradas en la flora peruana mientras descubres los usos medicinales y culturales de nuestras plantas.',
        imagePath: 'assets/images/ceramica_workshop.png',
        phases: [
          WorkshopPhase(
            number: 1,
            title: 'Introducción',
            description:
                'Conoce la historia de la cerámica andina y las plantas nativas del Perú. Presentación de herramientas y materiales.',
            durationMinutes: 45,
            activities: [
              'Historia de la cerámica Moche y Nazca',
              'Introducción a plantas medicinales andinas',
              'Preparación del espacio de trabajo',
              'Distribución de materiales',
            ],
          ),
          WorkshopPhase(
            number: 2,
            title: 'Técnicas básicas',
            description:
                'Aprende técnicas fundamentales de modelado, decoración con motivos botánicos y acabados naturales.',
            durationMinutes: 90,
            activities: [
              'Técnica de enrollado (coiling)',
              'Modelado de formas básicas',
              'Decoración con motivos de plantas',
              'Creación de texturas naturales',
            ],
          ),
          WorkshopPhase(
            number: 3,
            title: 'Creación libre',
            description:
                'Desarrolla tu propia pieza cerámica inspirada en la naturaleza. Los instructores te guiarán en tu proceso creativo.',
            durationMinutes: 105,
            activities: [
              'Diseño de pieza personal',
              'Aplicación de técnicas aprendidas',
              'Decoración con pigmentos naturales',
              'Preparación para cocción',
            ],
          ),
        ],
        durationHours: 4,
        price: 85.00,
        maxParticipants: 15,
      ),
    ];
  }
}

class WorkshopPhase {
  final int number;
  final String title;
  final String description;
  final int durationMinutes;
  final List<String> activities;

  WorkshopPhase({
    required this.number,
    required this.title,
    required this.description,
    required this.durationMinutes,
    required this.activities,
  });
}
