import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:soilmaster/src/firebase/crops/cropdata.dart';

final profileProvider = StateProvider<bool>((ref) => false);

final farmtypeProvider = StateProvider<Enum>((ref) {
  return FarmType.cropfarming;
});

final pageindexProv = StateProvider<int>((ref) {
  return 1;
});
