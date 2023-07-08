import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:salah_app/core/functions/get_cycle.dart';
import 'package:salah_app/core/utils/enums.dart';

final currentPrayerProvider = StateProvider((ref) => Prayer.maghrib);

final cycleProvider = StateProvider((ref) {
  final currentPrayer = ref.read(currentPrayerProvider);
  return getCycle(currentPrayer);
});
