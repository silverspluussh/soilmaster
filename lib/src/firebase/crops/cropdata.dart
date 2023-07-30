class CropsModel {
  String? croptype;
  Map<String, dynamic>? optimumlevels;

  CropsModel({this.croptype, this.optimumlevels});
}

List<CropsModel> cereals = [
  CropsModel(croptype: 'rice', optimumlevels: {
    'min_humidity': 70,
    'max_humidity': 80,
    'min_temp': 20,
    'max_temp': 40,
    'soilmoisture': 0.0,
    'hint':
        'It needs consistently moist soil, with standing water in the fields during part of the growing period. Rice is typically cultivated in warm climates and the best season varies depending on the region.'
  }),
  CropsModel(croptype: 'corn', optimumlevels: {
    'min_humidity': 50,
    'max_humidity': 80,
    'min_temp': 15,
    'max_temp': 35,
    'soilmoisture': 0.0,
    'hint':
        'It requires moderate soil moisture levels but can tolerate drier conditions during the later stages. Corn is usually grown in spring or early summer, depending on the climate.'
  }),
  CropsModel(croptype: 'wheat', optimumlevels: {
    'min_humidity': 50,
    'max_humidity': 60,
    'min_temp': 15,
    'max_temp': 24,
    'soilmoisture': 0.0,
    'hint':
        'Soil moisture level should be moderate, avoiding waterlogged or excessively dry conditions. Best season for wheat is typically late fall or early spring, depending on the variety and climate.'
  }),
];

List<CropsModel> vegetables = [
  CropsModel(croptype: 'tomatoes/peppers', optimumlevels: {
    'min_humidity': 40,
    'max_humidity': 70,
    'min_temp': 21,
    'max_temp': 29,
    'soilmoisture': 0.0,
    'hint':
        'Soil moisture should be consistent but not waterlogged. Tomatoes are warm-season crops and are typically grown in spring or early summer.'
  }),
  CropsModel(croptype: 'Cabbage', optimumlevels: {
    'min_humidity': 40,
    'max_humidity': 60,
    'min_temp': 7,
    'max_temp': 24,
    'soilmoisture': 0.0,
    'hint':
        'Soil moisture level should be kept consistently moist but not saturated. Lettuce is a cool-season crop and is typically grown in spring or fall, depending on the variety and climate.'
  }),
  CropsModel(croptype: 'carrots', optimumlevels: {
    'min_humidity': 40,
    'max_humidity': 60,
    'min_temp': 15,
    'max_temp': 24,
    'soilmoisture': 0.0,
    'hint':
        'Soil moisture should be consistently moist but not waterlogged. Carrots are cool-season crops and can be grown in spring or fall.'
  }),
];

enum FarmType { cropfarming, fishfarming }

String idgen() {
  final now = DateTime.now();
  return now.microsecondsSinceEpoch.toString();
}
