import 'package:flutter_riverpod/flutter_riverpod.dart';

final renderProvider = StateProvider<Pages>((ref) {
  return Pages.home;
});

enum Pages { home, settings, notes, weather, analysis, farm }
