import 'package:salah_app/core/utils/enums.dart';

Cycle getCycle(Prayer currentPrayer) {
  switch (currentPrayer) {
    case Prayer.fajr:
      return Cycle.night;
    case Prayer.sunrise:
      return Cycle.day;
    case Prayer.dhuhr:
      return Cycle.day;
    case Prayer.asr:
      return Cycle.day;
    case Prayer.maghrib:
      return Cycle.night;
    case Prayer.isha:
      return Cycle.night;
  }
}
