import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:salah_app/core/functions/get_cycle.dart';
import 'package:salah_app/core/state/state.dart';

class ApplicationController {
  ApplicationController();

  static void registerCurrentPrayerListener(WidgetRef ref) {
    ref.listen(currentPrayerProvider, (previous, current) {
      final cycleNotifier = ref.read(cycleProvider.notifier);
      cycleNotifier.state = getCycle(current);
    });
  }
}
