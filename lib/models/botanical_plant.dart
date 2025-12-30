class BotanicalPlant {
  final String id;
  final String name;
  final String scientificName;
  final String shortDescription;
  final String longDescription;
  final String iconPath;
  final String imagePath;
  final List<String> properties;
  final List<String> uses;

  BotanicalPlant({
    required this.id,
    required this.name,
    required this.scientificName,
    required this.shortDescription,
    required this.longDescription,
    required this.iconPath,
    required this.imagePath,
    required this.properties,
    required this.uses,
  });

  // Sample data for the museum's native plants
  static List<BotanicalPlant> getSamplePlants() {
    return [
      BotanicalPlant(
        id: 'una_de_gato',
        name: 'Uña de Gato',
        scientificName: 'Uncaria tomentosa',
        shortDescription: 'Planta medicinal andina con propiedades inmunoestimulantes',
        longDescription:
            'En la antigüedad se consideraba una planta sagrada para los pueblos originarios y del imperio Inca, en la cual, las especies de Uncaria eran ampliamente utilizadas inmunoestimulantes y antiinflamatorios.',
        iconPath: 'assets/icons/una_de_gato.png',
        imagePath: 'assets/images/una_de_gato_detail.png',
        properties: [
          'Inmunoestimulante',
          'Antiinflamatorio',
          'Antioxidante',
          'Antiviral'
        ],
        uses: [
          'Refuerzo del sistema inmunológico',
          'Tratamiento de artritis',
          'Prevención de enfermedades',
          'Cicatrización de heridas'
        ],
      ),
      BotanicalPlant(
        id: 'maca',
        name: 'Maca',
        scientificName: 'Lepidium meyenii',
        shortDescription: 'Superalimento andino conocido por sus propiedades energéticas',
        longDescription:
            'Para andinos, se le conoce también como "ginseng peruano". La maca aumenta la resistencia y la vitalidad y es conocida por favorecer la fertilidad tanto en hombres como en mujeres. Se dice que los incas la consumían antes de sus batallas que requerían de mayor resistencia física y mental, según estudios.',
        iconPath: 'assets/icons/maca.png',
        imagePath: 'assets/images/maca_detail.png',
        properties: [
          'Energizante natural',
          'Afrodisíaco',
          'Regulador hormonal',
          'Nutritivo'
        ],
        uses: [
          'Aumento de energía y resistencia',
          'Mejora de la fertilidad',
          'Balance hormonal',
          'Rendimiento deportivo'
        ],
      ),
      BotanicalPlant(
        id: 'muna',
        name: 'Muña',
        scientificName: 'Minthostachys mollis',
        shortDescription: 'Hierba aromática con propiedades digestivas',
        longDescription:
            'Hierba aromática y medicinal originaria de los Andes. Es valiosa tanto en la medicina tradicional como en la cocina. Su sabor mentolado y digestión, y también se usa para aliviar dolores de cabeza y problemas respiratorios. Su fragancia característica también la convierte en un excelente repelente de insectos de forma natural.',
        iconPath: 'assets/icons/muna.png',
        imagePath: 'assets/images/muna_detail.png',
        properties: [
          'Digestivo',
          'Carminativo',
          'Expectorante',
          'Aromático'
        ],
        uses: [
          'Alivio de problemas digestivos',
          'Tratamiento de resfriados',
          'Repelente natural de insectos',
          'Infusiones medicinales'
        ],
      ),
      BotanicalPlant(
        id: 'hercampuri',
        name: 'Hercampuri',
        scientificName: 'Gentianella alborosea',
        shortDescription: 'Planta medicinal para la salud hepática',
        longDescription:
            'El hercampuri es una planta medicinal andina conocida por sus propiedades depurativas y hepatoprotectoras. Se utiliza tradicionalmente para la limpieza del hígado, reducción de colesterol y control de peso. Es una planta muy valorada en la medicina tradicional peruana.',
        iconPath: 'assets/icons/hercampuri.png',
        imagePath: 'assets/images/hercampuri_detail.png',
        properties: [
          'Hepatoprotector',
          'Depurativo',
          'Hipocolesterolemiante',
          'Diurético'
        ],
        uses: [
          'Limpieza hepática',
          'Reducción de colesterol',
          'Control de peso',
          'Desintoxicación'
        ],
      ),
    ];
  }
}
