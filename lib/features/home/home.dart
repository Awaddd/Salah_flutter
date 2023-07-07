import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:salah_app/core/state/state.dart';
import 'package:salah_app/core/utils/constants.dart';
import 'package:salah_app/core/utils/enums.dart';
import 'package:salah_app/core/utils/extensions.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;

    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    final cycle = ref.watch(cycleProvider);
    final currentPrayer = ref.watch(currentPrayerProvider);

    ref.listen(currentPrayerProvider, (previous, current) {
      final cycleNotifier = ref.read(cycleProvider.notifier);

      switch (current) {
        case Prayers.fajr:
          cycleNotifier.state = Cycle.night;
        case Prayers.sunrise:
          cycleNotifier.state = Cycle.day;
        case Prayers.dhuhr:
          cycleNotifier.state = Cycle.day;
        case Prayers.asr:
          cycleNotifier.state = Cycle.day;
        case Prayers.maghrib:
          cycleNotifier.state = Cycle.night;
        case Prayers.isha:
          cycleNotifier.state = Cycle.night;
      }
    });

    return Stack(
      children: [
        SizedBox(height: height),

        Container(
          width: double.infinity,
          height: height * 0.5,
          padding: const EdgeInsets.all(md),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                cycle == Cycle.night ? 'assets/night.jpg' : 'assets/day.jpg',
              ),
              fit: BoxFit.cover,
              alignment: cycle == Cycle.night
                  ? Alignment.topCenter
                  : Alignment.bottomCenter,
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    currentPrayer.getPrayerName().capitalize(),
                    style: textTheme.titleLarge?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  //
                  IconButton(
                    onPressed: () {
                      ref.read(currentPrayerProvider.notifier).state =
                          Prayers.asr;
                    },
                    icon: const Icon(Icons.menu),
                    color: Colors.white,
                  )
                ],
              )
            ],
          ),
        ),

        //
        Positioned.fill(
          top: height * 0.40,
          child: Container(
            decoration: BoxDecoration(
              color: colorScheme.background,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              ),
            ),
            child: const Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: lg),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
