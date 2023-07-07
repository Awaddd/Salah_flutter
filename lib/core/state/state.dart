import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:salah_app/core/utils/enums.dart';

final currentPrayerProvider = StateProvider((ref) => Prayers.maghrib);

final cycleProvider = StateProvider((ref) {
  final currentPrayer = ref.read(currentPrayerProvider);

  switch (currentPrayer) {
    case Prayers.fajr:
      return Cycle.night;
    case Prayers.sunrise:
      return Cycle.day;
    case Prayers.dhuhr:
      return Cycle.day;
    case Prayers.asr:
      return Cycle.day;
    case Prayers.maghrib:
      return Cycle.night;
    case Prayers.isha:
      return Cycle.night;
  }
});
